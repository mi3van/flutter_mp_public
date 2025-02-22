import 'package:data/src/common/entity/isar_dto/db_user.dart';

// The top-level API not used userUuid
mixin UserApiMixin {
  Future<int> createData(DbUser data);

  Future<DbUser?> readByUuid(String uuid);

  Future<int> updateData(DbUser data);

  Future<bool> deleteByUuid(String uuid);

  // Future<bool> deleteAllData();

  Future<DbUser?> getUserByEmail(String email);

  Future<List<DbUser>> getUsersPack(List<String> userUuids);

  Future<List<String>> getAllLocalUserUuids();
}
