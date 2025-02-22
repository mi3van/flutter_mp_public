import 'package:domain/domain.dart';

mixin BaseStorageApiMixin<T> on BaseStorageRepositoryMixin<T> {
  Future<int> createData(T data, {required String dbUserUuid});
}

mixin BaseDbApiMixin<T> on BaseStorageApiMixin<T>, BaseDbRepositoryMixin<T> {}

mixin BaseUuidApiMixin<T>
    on BaseStorageApiMixin<T>, BaseUuidRepositoryMixin<T> {}
