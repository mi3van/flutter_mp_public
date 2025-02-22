mixin BaseStorageRepositoryMixin<T> {
  Future<int> updateData(T data, {required String dbUserUuid});

  Future<void> updateAllData(List<T> dataList, {required String userUuid});

  Future<bool> deleteAllData({required String dbUserUuid});
}

mixin BaseDbRepositoryMixin<T> implements BaseStorageRepositoryMixin<T> {
  Future<T?> readData(int id, {required String dbUserUuid});

  Future<bool> deleteData(int id, {required String dbUserUuid});
}

mixin BaseUuidRepositoryMixin<T> implements BaseStorageRepositoryMixin<T> {
  Future<T?> readByUuid(String uuid, {required String userUuid});
  Future<bool> deleteByUuid(String uuid, {required String userUuid});

  Future<void> importJson(
    List<Map<String, dynamic>> jsonList, {
    required String userUuid,
  });
  Future<List<Map<String, dynamic>>> exportJson({
    required String userUuid,
  });
}

mixin TypedRepositoryMixin<T> {
  Future<void> updateData(T type, String? data);
  Future<String?> readData(T type);
  Future<void> deleteData(T type);
  Future<void> deleteAllData();
}
