import 'dart:typed_data';

import 'package:domain/src/common/entity/enums/secure_data.dart';
import 'package:domain/src/contract/repository/base_storage_repostitory_mixin.dart';

mixin SecureStorageRepositoryMixin implements TypedRepositoryMixin<SecureData> {
  Future<List<int>> encryptWithSalsa(
    List<int> data, {
    required String password,
  });
  Future<List<int>> decryptWithSalsa(
    Uint8List bytes, {
    required String password,
  });
}
