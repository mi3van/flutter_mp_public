import 'package:data/src/api/isar/user_linked/base_linked_data_api.dart';
import 'package:data/src/common/entity/isar_dto/db_user.dart';
import 'package:data/src/common/entity/isar_dto/db_user_private_data.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:isar/isar.dart';

class UserSyncDataStorageApi extends BaseUserLinkedDataApi<DbUserPrivateData> {
  @override
  DbUserPrivateData getEmptyUserLinkedData({required userDbId}) {
    return UserRepository.newDbUserSyncDataDto(userDbId);
  }

  @override
  Future<int> putInDbUserLinkedData(
    Isar initedToWriteIsar,
    DbUserPrivateData newData,
  ) {
    return initedToWriteIsar.dbUserPrivateDatas.put(newData);
  }

  @override
  Future<bool> deleteData(id) async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.writeTxn(() async {
      return dbInstance.dbUserPrivateDatas.delete(id);
    });
  }

  @override
  Future<bool> deleteAllData() async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.writeTxn(() async {
      try {
        await dbInstance.dbUserPrivateDatas.clear();
        return true;
      } catch (e) {
        return false;
      }
    });
  }

  Future<DbUserPrivateData> getSyncDataUser(DbUser dbUser) {
    return getOrCreateUserLinkedData(dbUser, dbUser.userPrivateDataLink);
  }

  Future<int> updateSyncDataInUser(DbUser dbUser) async {
    return updateLinkedDataInUser(
      dbUser.id,
      dbUser.userPrivateDataLink,
    );
  }
}
