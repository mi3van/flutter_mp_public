import 'dart:typed_data';

typedef EncryptData = ({List<int> data, Uint8List key, Uint8List iv});
typedef DecryptData = ({Uint8List bytes, Uint8List key, Uint8List iv});

mixin SecureStorageApiMixin {
  Future<void> updateData(String key, String? data);
  Future<String?> readData(String key);
  Future<void> deleteData(String key);
  Future<void> deleteAllData();

  List<int> encryptWithSalsa(EncryptData data);
  List<int> decryptWithSalsa(DecryptData data);
}
