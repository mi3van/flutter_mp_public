import 'package:data/src/api/isar/user_linked/base_linked_data_api.dart';
import 'package:data/src/common/entity/isar_dto/db_user.dart';
import 'package:data/src/common/entity/isar_dto/db_user_settings.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:isar/isar.dart';

class UserSettingsStorageApi extends BaseUserLinkedDataApi<DbUserSettings> {
  @override
  DbUserSettings getEmptyUserLinkedData({required int userDbId}) =>
      UserRepository.newDbUserSettingsDto(userDbId);

  @override
  Future<int> putInDbUserLinkedData(
    Isar initedToWriteIsar,
    DbUserSettings newData,
  ) {
    return initedToWriteIsar.dbUserSettings.put(newData);
  }

  @override
  Future<bool> deleteData(id) async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.writeTxn(() async {
      return dbInstance.dbUserSettings.delete(id);
    });
  }

  @override
  Future<bool> deleteAllData() async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.writeTxn(() async {
      try {
        await dbInstance.dbUserSettings.clear();
        return true;
      } catch (e) {
        return false;
      }
    });
  }

  Future<DbUserSettings> getSettingsUser(DbUser dbUser) =>
      getOrCreateUserLinkedData(dbUser, dbUser.userSettingsLink);

  Future<int> updateSettingsInUser(DbUser dbUser) async {
    return updateLinkedDataInUser(
      dbUser.id,
      dbUser.userSettingsLink,
    );
  }
}
