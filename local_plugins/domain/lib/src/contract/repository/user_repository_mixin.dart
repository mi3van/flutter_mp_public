import 'package:domain/src/common/entity/dto/user/settings.dart';
import 'package:domain/src/common/entity/dto/user/user.dart';

mixin UserRepositoryMixin
    implements
        OriginalUserRepositoryMixin,
        UserSyncDataRepositoryMixin,
        UserSettingsRepositoryMixin {
  Future<String> createUser();
  Future<User?> readByUuid(String uuid);
  Future<int> updateData(User user);
  Future<bool> deleteByUuid(String uuid);
  Future<User?> getUserByEmail(String email);
  Future<List<User>> getUsersPack(List<String> userUuids);
  Future<List<String>> getAllOriginalUserUuids();
  Future<bool> readAndSetOriginalUser(String uuid);
  Future<String?> getUserLocalRootId(String userUuid);
  Future<bool> updateUserCloudRootFolderId({
    required String userUuid,
    required String? cloudRootId,
  });
  Future<String?> getUserEmail({required String userUuid});
}

mixin OriginalUserRepositoryMixin {
  User get originalUser;
}

mixin UserSettingsRepositoryMixin {
  Future<UserSettings> getOriginalUserSettings();
  Future<int> updateOriginalUserSettings(UserSettings newUserSettings);
}

mixin UserSyncDataRepositoryMixin {
  // User db sync data logic.
  void cleanSyncValuesCache();

  Future<DateTime?> getUserLastSyncDate(String userUuid);
  Future<bool> updateUserLastSyncDate(String userUuid, DateTime newDate);

// Last synced event.
  Future<String?> getLastItemSyncedEventUuid(String userUuid);
  Future<bool> updateLastItemSyncedEventUuid({
    required String userUuid,
    required String? eventUuid,
  });
  Future<String?> getLastFileSyncedEventUuid(String userUuid);
  Future<bool> updateLastFileSyncedEventUuid({
    required String userUuid,
    required String? eventUuid,
  });
// Blocked for sync event, not available for edit.
  Future<String?> getBlockedItemEventUuid(String userUuid);
  Future<bool> updateBlockedItemEventUuid({
    required String userUuid,
    required String? eventUuid,
  });
  Future<String?> getBlockedFileEventUuid(String userUuid);
  Future<bool> updateBlockedFileEventUuid({
    required String userUuid,
    required String? eventUuid,
  });
// Event, that was handled only with element.
  Future<String?> getLastItemElementPushedEventUuid(String userUuid);
  Future<bool> updateLastItemElementPushedEventUuid({
    required String userUuid,
    required String? eventUuid,
  });
  Future<String?> getLastFileElementPushedEventUuid(String userUuid);
  Future<bool> updateLastFileElementPushedEventUuid({
    required String userUuid,
    required String? eventUuid,
  });
// To next token for elements, needs for restore "all download from cloud".
  Future<String?> getItemNextPageToken(String userUuid);
  Future<bool> updateItemNextPageToken(String userUuid, String? newToken);

  Future<String?> getFileNextPageToken(String userUuid);
  Future<bool> updateFileNextPageToken(String userUuid, String? newToken);
// Count for in-cloud folder max limit check.
  Future<int?> getEventsItemCountForCheck(String userUuid);
  Future<bool> updateEventsItemCountForCheck(String userUuid, int newCount);

  Future<int?> getEventsFileCountForCheck(String userUuid);
  Future<bool> updateEventsFileCountForCheck(String userUuid, int newCount);

  Future<void> deleteUserSyncData(String userUuid);
}
