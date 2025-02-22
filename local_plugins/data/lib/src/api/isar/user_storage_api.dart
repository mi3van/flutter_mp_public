import 'package:data/data.dart';
import 'package:data/src/api/isar/base_isar_api.dart';
import 'package:data/src/common/entity/isar_dto/db_user.dart';
import 'package:isar/isar.dart';

class UserStorageApi implements BaseIsarMainApiMixin, UserApiMixin {
  @override
  Future<Isar> initIsarMainDb() => HelperIsarDb.getIsarUsersDb();

  @override
  Future<DbUser?> readByUuid(uuid) async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.dbUsers.getByUserPathUuid(uuid);
  }

  @override
  Future<int> createData(dbUser) => updateData(dbUser);

  @override
  Future<int> updateData(dbUser) async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.writeTxn(() async {
      final dataResultId = await dbInstance.dbUsers.put(dbUser);
      HelperIsarDb.checkIdsAfterSave(
        oldId: dbUser.id,
        newId: dataResultId,
      );
      return dataResultId;
    });
  }

  @override
  Future<DbUser?> getUserByEmail(String email) async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.dbUsers.getByEmail(email);
  }

  @override
  Future<List<DbUser>> getUsersPack(List<String> userUuids) async {
    final dbInstance = await initIsarMainDb();
    final users = await dbInstance.dbUsers.getAllByUserPathUuid(userUuids);
    return users.whereType<DbUser>().toList();
  }

  @override
  Future<List<String>> getAllLocalUserUuids() async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.dbUsers
        .where()
        .roleEqualTo(userDefaultLocalRole.toString())
        .or()
        .roleIsNull()
        .userPathUuidProperty()
        .findAll();
  }

  @override
  Future<bool> deleteByUuid(uuid) async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.writeTxn(() async {
      // if (kDebugMode) {
      // Delete user private data
      // final deletedPrData = await getUserSyncData();
      // print("private data after deleting user: ${deletedPrData.toString()}");
      // final prDataInDb =
      //     await _debugGetSyncData(_dbUser!.userSyncDataLink.value!.id);
      // print(
      //     "private data id:${_dbUser!.userSyncDataLink.value!.id} in db: ${prDataInDb.toString()}");

      // Delete user settings

      // final deletedUserSettings = await getUserSettings();
      // print(
      //     "private data after deleting user: ${deletedUserSettings.toString()}");
      // final userSettingsInDb =
      //     await _debugGetSettings(_dbUser!.userSettingsLink.value!.id);
      // print(
      //     "settings id:${_dbUser!.userSettingsLink.value!.id} in db: ${userSettingsInDb.toString()}");
      // }
      return dbInstance.dbUsers.deleteByUserPathUuid(uuid);
    });
  }

  // @override
  // Future<bool> deleteAllData() async {
  //   final dbInstance = await initIsarMainDb();
  //   return dbInstance.writeTxn(() async {
  //     try {
  //       await dbInstance.dbUsers.clear();
  //       return true;
  //     } catch (e) {
  //       return false;
  //     }
  //   });
  // }
}
