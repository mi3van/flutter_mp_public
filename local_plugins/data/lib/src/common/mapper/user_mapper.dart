import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:data/src/common/entity/isar_dto/db_user.dart';
import 'package:data/src/common/entity/isar_dto/db_user_private_data.dart';
import 'package:data/src/common/entity/isar_dto/db_user_settings.dart';
import 'package:domain/domain.dart';
import 'package:isar/isar.dart';

abstract class UserMapper {
  static User toCoreModel(DbUser dbModel) => User(
      userId: dbModel.id,
      dbUserUuid: dbModel.userPathUuid,
      role: Role.fromDb(dbModel.role ?? userDefaultLocalRole.toString()),
      email: dbModel.email)
    ..avatarPreview = dbModel.avatarPreview != null
        ? Uint8List.fromList(dbModel.avatarPreview!)
        : null
    ..nickname = dbModel.nickname
    ..cloudFolderUuid = dbModel.rootFolderUuid;

  // After adding fields don't forget update the UserFieldsMapper!

  static DbUser toDbModel(
    User coreModel,
    IsarLink<DbUserPrivateData> dBUserSyncDataLink,
    IsarLink<DbUserSettings> dBUserSettingsLink,
  ) =>
      DbUser(
        dbUserPrivateDataLink: dBUserSyncDataLink,
        dbUserSettingsLink: dBUserSettingsLink,
        dbId: coreModel.userId,
      )
        ..userPathUuid = coreModel.dbUserUuid
        ..avatarPreview = coreModel.avatarPreview
        ..nickname = coreModel.nickname
        ..role = coreModel.role.toString()
        ..email = coreModel.email
        ..rootFolderUuid = coreModel.cloudFolderUuid;

  static DbUser setDbUserFields(DbUser modelToSet, DbUser fromModel) {
    return modelToSet
      ..userPathUuid = fromModel.userPathUuid
      ..nickname = fromModel.nickname
      ..avatarPreview = fromModel.avatarPreview
      ..role = fromModel.role
      ..email = fromModel.email
      ..rootFolderUuid = fromModel.rootFolderUuid;
  }

  static List<User> toCoreModelsList(List<DbUser> dbList) =>
      dbList.map((dbData) => toCoreModel(dbData)).toList();

  static UserSettings toCoreSettingsModel(DbUserSettings dbModel) {
    return UserSettings(
      localId: dbModel.id,
      localeCode: dbModel.localeCode,
      syncFrequency: SyncFrequencyType.fromInt(dbModel.syncFrequencyValue),
      imageCompress: ImageCompressType.fromInt(dbModel.imageCompressValue),
      theme: ThemeType.fromInt(dbModel.themingValue),
      isWelcomeWathed: dbModel.isWelcomeWathed,
      sortModel: _byteToSortModel(dbModel.sortModelValue),
      tooltipsWatched: dbModel.tooltipsWatched,
      printQrColumnsCount: dbModel.printQrColumnsCount,
      printReportColumnsCount: dbModel.printReportColumnsCount,
      isPrintReportUiMode: dbModel.isPrintReportUiMode,
      isCameraFlashEnabled: dbModel.isCameraFlashEnabled,
    );
  }

  static void setDbSettingsDataFields({
    required DbUserSettings target,
    required UserSettings newInfo,
  }) {
    target
      ..localeCode = newInfo.localeCode
      ..syncFrequencyValue = newInfo.syncFrequency.value
      ..imageCompressValue = newInfo.imageCompress.settingsValue
      ..themingValue = newInfo.theme.value
      ..isWelcomeWathed = newInfo.isWelcomeWathed
      ..sortModelValue = _sortModelToByte(newInfo.sortModel)
      ..tooltipsWatched = newInfo.tooltipsWatched
      ..printQrColumnsCount = newInfo.printQrColumnsCount
      ..printReportColumnsCount = newInfo.printReportColumnsCount
      ..isPrintReportUiMode = newInfo.isPrintReportUiMode
      ..isCameraFlashEnabled = newInfo.isCameraFlashEnabled;
  }

  static int _sortModelToByte(SortModel sortModel) {
    int result = sortModel.sortType.value;
    result += sortModel.isAscending ? SortModel.ascendingValue : 0;
    result += sortModel.isFavoritesOnTop ? SortModel.favoriteTopValue : 0;
    return result;
  }

  static SortModel _byteToSortModel(int sortModelValue) {
    SortType sortType;
    bool isAscending = false;
    bool isFavoritesOnTop = false;

    if (sortModelValue >= SortModel.favoriteTopValue) {
      isFavoritesOnTop = true;
      sortModelValue -= SortModel.favoriteTopValue;
    }

    if (sortModelValue % 2 != 0) {
      isAscending = true;
      sortModelValue -= SortModel.ascendingValue;
    }

    sortType = SortType.fromInt(sortModelValue);

    return SortModel(
      sortType,
      isAscending: isAscending,
      isFavoritesOnTop: isFavoritesOnTop,
    );
  }
}
