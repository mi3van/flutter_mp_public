import 'package:data/src/api/isar/base_isar_api.dart';
import 'package:data/src/common/entity/isar_dto/db_user.dart';
import 'package:data/src/common/helper_isar_db.dart';
import 'package:isar/isar.dart';

abstract class BaseUserLinkedDataApi<T> implements BaseIsarMainApiMixin {
  @override
  Future<Isar> initIsarMainDb() => HelperIsarDb.getIsarUsersDb();

  T getEmptyUserLinkedData({required int userDbId});
  Future<int> putInDbUserLinkedData(Isar initedToWriteIsar, T newData);
  Future<bool> deleteData(int id);
  Future<bool> deleteAllData();

  Future<T> getOrCreateUserLinkedData(
    DbUser dbUser,
    IsarLink<T> isarLinkTyped,
  ) async =>
      await _getUserLinkedData(isarLinkTyped) ??
      await _createUserLinkedDataInDb(dbUser, isarLinkTyped);

  Future<T?> _getUserLinkedData(
    IsarLink<T> isarLinkTyped,
  ) async {
    if (!isarLinkTyped.isLoaded) {
      await isarLinkTyped.load();
    }
    return isarLinkTyped.value;
  }

  Future<int> updateLinkedDataInUser(
    int userId,
    IsarLink<T> isarLinkTypedUpdated,
  ) async {
    final value = isarLinkTypedUpdated.value as T;
    final dbInstance = await initIsarMainDb();
    return dbInstance.writeTxn(() async {
      final updatedDataId = await putInDbUserLinkedData(dbInstance, value);
      HelperIsarDb.checkIdsAfterSave(
        oldId: userId,
        newId: updatedDataId,
      );
      await isarLinkTypedUpdated.save();
      await isarLinkTypedUpdated.load();

      return updatedDataId;
    });
  }

  Future<T> _createUserLinkedDataInDb(
    DbUser dbUser,
    IsarLink<T> isarLinkTyped,
  ) async {
    final dbInstance = await initIsarMainDb();
    return dbInstance.writeTxn(() async {
      final userId = dbUser.id;
      final newUserLinkedData = getEmptyUserLinkedData(userDbId: userId);
      final newDataId = await putInDbUserLinkedData(
        dbInstance,
        newUserLinkedData,
      );
      HelperIsarDb.checkIdsAfterSave(
        oldId: newDataId,
        newId: userId,
      );
      isarLinkTyped.value = newUserLinkedData;
      final updatedUserId = await dbInstance.dbUsers.put(dbUser);
      HelperIsarDb.checkIdsAfterSave(
        oldId: userId,
        newId: updatedUserId,
      );
      return isarLinkTyped.value as T;
    });
  }
}
