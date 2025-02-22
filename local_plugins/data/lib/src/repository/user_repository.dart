import 'package:data/data.dart';
import 'package:data/src/api/isar/user_linked/user_settings_storage_api.dart';
import 'package:data/src/api/isar/user_linked/user_sync_data_storage_api.dart';
import 'package:data/src/common/entity/isar_dto/db_user.dart';
import 'package:data/src/common/entity/isar_dto/db_user_private_data.dart';
import 'package:data/src/common/entity/isar_dto/db_user_settings.dart';
import 'package:data/src/common/mapper/user_mapper.dart';
import 'package:domain/domain.dart';

class UserRepository implements UserRepositoryMixin {
  late final _userApi = UserStorageApi();
  late final _syncDataApi = UserSyncDataStorageApi();
  late final _settingsApi = UserSettingsStorageApi();

// User that originally owns the application data.
  DbUser? _dbOriginalUser;
  DbUser? _dbLastSyncedUser;

  @override
  User get originalUser => UserMapper.toCoreModel(_dbOriginalUser!);

  @override
  Future<User?> readByUuid(String uuid) async {
    final user = await _getDbUser(uuid);
    if (user == null) {
      return null;
    }
    return UserMapper.toCoreModel(user);
  }

  @override
  Future<bool> readAndSetOriginalUser(String uuid) async {
    final user = await _getDbUser(uuid);
    _dbOriginalUser = user;
    return user != null;
  }

  @override
  Future<String> createUser() async {
    final emptyDbUser = _newLocalUserDto();
    await _userApi.createData(emptyDbUser);
    return emptyDbUser.userPathUuid;
  }

  @override
  Future<int> updateData(newUser) async {
    final dbUser = await _getDbUser(newUser.dbUserUuid);
    if (dbUser == null) {
      throw UserUpdateException();
    }

    final newDbUser = UserMapper.toDbModel(
      newUser,
      dbUser.userPrivateDataLink,
      dbUser.userSettingsLink,
    );
    _updateUserCache(newDbUser);

    return _userApi.updateData(newDbUser);
  }

  @override
  Future<List<String>> getAllOriginalUserUuids() {
    return _userApi.getAllLocalUserUuids();
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    final dbUser = await _userApi.getUserByEmail(email);

    return dbUser != null ? UserMapper.toCoreModel(dbUser) : null;
  }

  @override
  Future<List<User>> getUsersPack(List<String> userUuids) async {
    final dbUsers = await _userApi.getUsersPack(userUuids);
    return UserMapper.toCoreModelsList(dbUsers);
  }

  @override
  Future<bool> deleteByUuid(String userUuid) async {
    final dbUser = await _getDbUser(userUuid);
    bool isSuccess = await _userApi.deleteByUuid(userUuid);
    if (!isSuccess || dbUser == null) return false;

    final userSyncData = await _syncDataApi.getSyncDataUser(dbUser);
    isSuccess = isSuccess && await _syncDataApi.deleteData(userSyncData.id);

    final userSettings = await _settingsApi.getSettingsUser(dbUser);
    isSuccess = isSuccess && await _settingsApi.deleteData(userSettings.id);

    if (userUuid == _dbOriginalUser?.userPathUuid) {
      _dbOriginalUser = null;
    }
    if (userUuid == _dbLastSyncedUser?.userPathUuid) {
      _dbLastSyncedUser = null;
    }
    return isSuccess;
  }

  // @override
  // Future<bool> deleteAllData() async {
  //   final isSuccess = (await _userApi.deleteAllData()) &&
  //       (await _syncDataApi.deleteAllData()) &&
  //       (await _settingsApi.deleteAllData());
  //   if (isSuccess) {
  //     _dbOriginalUser = null;
  //    _dbLastSyncedUser = null;
  //   }
  //   return isSuccess;
  // }

  @override
  Future<String?> getUserLocalRootId(String userUuid) async {
    return (await _getDbUser(userUuid))?.rootFolderUuid;
  }

  @override
  Future<bool> updateUserCloudRootFolderId({
    required String userUuid,
    required String? cloudRootId,
  }) async {
    final dbUser = await _getDbUser(userUuid);
    if (dbUser == null) {
      throw UserUpdateException();
    }
    dbUser.rootFolderUuid = cloudRootId;
    return dbUser.id == (await _userApi.updateData(dbUser));
  }

  @override
  Future<String?> getUserEmail({required String userUuid}) async {
    return (await _getDbUser(userUuid))?.email;
  }

// User Settings part
  @override
  Future<UserSettings> getOriginalUserSettings() async {
    final dbUserSettings = await _settingsApi.getSettingsUser(_dbOriginalUser!);
    return UserMapper.toCoreSettingsModel(dbUserSettings);
  }

  @override
  Future<int> updateOriginalUserSettings(newUserSettings) async {
    final dbUserSettings = await _settingsApi.getSettingsUser(_dbOriginalUser!);
    UserMapper.setDbSettingsDataFields(
      target: dbUserSettings,
      newInfo: newUserSettings,
    );
    return _settingsApi.updateSettingsInUser(_dbOriginalUser!);
  }

// User Sync Data part
  @override
  void cleanSyncValuesCache() {
    _dbLastSyncedUser = null;
  }

  @override
  Future<DateTime?> getUserLastSyncDate(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.lastSyncedDate;
  }

  @override
  Future<bool> updateUserLastSyncDate(String userUuid, DateTime newDate) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.lastSyncedDate = newDate;
    });
  }

  @override
  Future<String?> getLastItemSyncedEventUuid(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.lastItemSyncedEventUuid;
  }

  @override
  Future<bool> updateLastItemSyncedEventUuid(
      {required String userUuid, required String? eventUuid}) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.lastItemSyncedEventUuid = eventUuid;
    });
  }

  @override
  Future<String?> getLastFileSyncedEventUuid(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.lastFileSyncedEventUuid;
  }

  @override
  Future<bool> updateLastFileSyncedEventUuid(
      {required String userUuid, required String? eventUuid}) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.lastFileSyncedEventUuid = eventUuid;
    });
  }

  @override
  Future<String?> getBlockedItemEventUuid(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.blockedItemEventUuid;
  }

  @override
  Future<bool> updateBlockedItemEventUuid(
      {required String userUuid, required String? eventUuid}) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.blockedItemEventUuid = eventUuid;
    });
  }

  @override
  Future<String?> getBlockedFileEventUuid(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.blockedFileEventUuid;
  }

  @override
  Future<bool> updateBlockedFileEventUuid(
      {required String userUuid, required String? eventUuid}) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.blockedFileEventUuid = eventUuid;
    });
  }

  @override
  Future<String?> getLastItemElementPushedEventUuid(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.lastItemHandledEventUuid;
  }

  @override
  Future<bool> updateLastItemElementPushedEventUuid(
      {required String userUuid, required String? eventUuid}) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.lastItemHandledEventUuid = eventUuid;
    });
  }

  @override
  Future<String?> getLastFileElementPushedEventUuid(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.lastFileHandledEventUuid;
  }

  @override
  Future<bool> updateLastFileElementPushedEventUuid(
      {required String userUuid, required String? eventUuid}) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.lastFileHandledEventUuid = eventUuid;
    });
  }

  @override
  Future<String?> getItemNextPageToken(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.syncItemNextPageTokn;
  }

  @override
  Future<bool> updateItemNextPageToken(String userUuid, String? newToken) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.syncItemNextPageTokn = newToken;
    });
  }

  @override
  Future<String?> getFileNextPageToken(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.syncFileNextPageTokn;
  }

  @override
  Future<bool> updateFileNextPageToken(String userUuid, String? newToken) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.syncFileNextPageTokn = newToken;
    });
  }

  @override
  Future<int?> getEventsItemCountForCheck(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.eventsItemCountForCheck;
  }

  @override
  Future<bool> updateEventsItemCountForCheck(String userUuid, int newCount) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.eventsItemCountForCheck = newCount;
    });
  }

  @override
  Future<int?> getEventsFileCountForCheck(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    return dbUserAndSync.$2.eventsFileCountForCheck;
  }

  @override
  Future<bool> updateEventsFileCountForCheck(String userUuid, int newCount) {
    return _actionAndUpdateSyncData(userUuid, (syncData) {
      syncData.eventsFileCountForCheck = newCount;
    });
  }

  @override
  Future<void> deleteUserSyncData(String userUuid) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    await _syncDataApi.deleteData(dbUserAndSync.$2.id);

    final userWithNoSyncLink = DbUser(
      dbUserPrivateDataLink: null,
      dbUserSettingsLink: dbUserAndSync.$1.userSettingsLink,
      dbId: dbUserAndSync.$1.id,
    );
    UserMapper.setDbUserFields(userWithNoSyncLink, dbUserAndSync.$1);
    _updateUserCache(userWithNoSyncLink);
    await _userApi.updateData(userWithNoSyncLink);
  }

  void _updateUserCache(DbUser dbUser) {
    if (_dbOriginalUser?.userPathUuid == dbUser.userPathUuid) {
      _dbOriginalUser = dbUser;
    }
    if (_dbLastSyncedUser?.userPathUuid == dbUser.userPathUuid) {
      _dbLastSyncedUser = dbUser;
    }
  }

  void _checkUserThrowable(DbUser? dbUser) {
    if (dbUser != null) return;

    throw UserNotFoundException();
  }

  Future<DbUser?> _getDbUser(String dbUserUuid) async {
    if (dbUserUuid == _dbOriginalUser?.userPathUuid) {
      return _dbOriginalUser;
    } else if (dbUserUuid == _dbLastSyncedUser?.userPathUuid) {
      return _dbLastSyncedUser;
    } else {
      return _userApi.readByUuid(dbUserUuid);
    }
  }

  Future<(DbUser, DbUserPrivateData)> _getLastSyncUserAndDataAndCache(
    String userUuid,
  ) async {
    if (userUuid != _dbLastSyncedUser?.userPathUuid) {
      _dbLastSyncedUser = await _getDbUser(userUuid);
    }
    _checkUserThrowable(_dbLastSyncedUser);
    return (
      _dbLastSyncedUser!,
      await _syncDataApi.getSyncDataUser(_dbLastSyncedUser!)
    );
  }

  Future<bool> _actionAndUpdateSyncData<T>(
    String userUuid,
    Function(DbUserPrivateData data) updateField,
  ) async {
    final dbUserAndSync = await _getLastSyncUserAndDataAndCache(userUuid);
    updateField(dbUserAndSync.$2);
    return dbUserAndSync.$2.id ==
        (await _syncDataApi.updateSyncDataInUser(dbUserAndSync.$1));
  }

  static DbUser _newLocalUserDto() {
    final newUuid = rLocator.uuidV8Crypto;
    return DbUser()
      ..userPathUuid = newUuid
      ..email = newUuid
      ..role = userDefaultLocalRole.toString();
  }

  static DbUserPrivateData newDbUserSyncDataDto(int userId) =>
      DbUserPrivateData(dbId: userId);

  static DbUserSettings newDbUserSettingsDto(int userId) => DbUserSettings(
        localeCode: autoLocaleCode,
        syncFrequencyValue: settingsDefaultSyncFrequency.value,
        imageCompressValue: settingsDefaultImageCompress.settingsValue,
        themingValue: settingsDefaultTheme.value,
        isWelcomeWathed: settingsDefaultWelcomeWathed,
        sortModelValue: settingsDefaultSortTypeValue,
        tooltipsWatched: settingsDefaultTooltipsWatched,
        printQrColumnsCount: settingsDefaultColumnsCount,
        printReportColumnsCount: settingsDefaultColumnsCount,
        isPrintReportUiMode: settingsDefaultIsPrintReportUiMode,
        isCameraFlashEnabled: settingsDefaultIsCameraFlashEnabled,
        dbId: userId,
      );
}
