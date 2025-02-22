import 'dart:typed_data';

import 'package:data/src/contract/secure_storage_api_mixin.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageApi implements SecureStorageApiMixin {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  @override
  Future<void> updateData(String key, String? data) {
    return _secureStorage.write(key: key, value: data);
  }

  @override
  Future<String?> readData(String key) {
    return _secureStorage.read(key: key);
  }

  @override
  Future<void> deleteData(String key) {
    return _secureStorage.delete(key: key);
  }

  @override
  Future<void> deleteAllData() {
    return _secureStorage.deleteAll();
  }

  @override
  List<int> encryptWithSalsa(data) {
    return _getEncrypter(data.key)
        .encryptBytes(data.data, iv: IV(data.iv))
        .bytes;
  }

  @override
  List<int> decryptWithSalsa(data) {
    return _getEncrypter(data.key)
        .decryptBytes(Encrypted(data.bytes), iv: IV(data.iv));
  }

  static Encrypter _getEncrypter(Uint8List key) {
    return Encrypter(Salsa20(Key(key)));
  }
}
