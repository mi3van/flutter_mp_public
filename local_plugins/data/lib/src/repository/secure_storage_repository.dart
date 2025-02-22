import 'dart:convert';
import 'dart:typed_data';

// ignore: depend_on_referenced_packages
import 'package:compute/compute.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class SecureStorageRepository implements SecureStorageRepositoryMixin {
  final _api = rLocator.secureStorageApi;

  @override
  Future<String?> readData(type) async {
    return _api.readData(type.toString());
  }

  @override
  Future<void> updateData(type, String? data) {
    return _api.updateData(type.toString(), data);
  }

  @override
  Future<void> deleteData(type) {
    return _api.deleteData(type.toString());
  }

  @override
  Future<void> deleteAllData() {
    return _api.deleteAllData();
  }

  @override
  Future<List<int>> encryptWithSalsa(data, {required password}) async {
    final keyIv = await compute(_getKeyAndIv, password);
    return compute(
      _api.encryptWithSalsa,
      (data: data, key: keyIv.$1, iv: keyIv.$2),
    );
  }

  @override
  Future<List<int>> decryptWithSalsa(bytes, {required password}) async {
    final keyAndIv = await compute(_getKeyAndIv, password);
    return compute(
      _api.decryptWithSalsa,
      (bytes: bytes, key: keyAndIv.$1, iv: keyAndIv.$2),
    );
  }

  (Uint8List, Uint8List) _getKeyAndIv(String password) {
    if (password.length > filePasswCharsMoreThan) {
      final divBy = (password.length * _keyInPercent).floor();
      return (
        _getPasswBytes(password.substring(0, divBy), _keyLength),
        _getPasswBytes(password.substring(divBy, password.length), _ivLength),
      );
    } else {
      throw PasswordCharCountException();
    }
  }
}

Uint8List _getPasswBytes(String passw, int neededLength) {
  Uint8List passwBytes = utf8.encode(passw);
  if (passwBytes.lengthInBytes < neededLength) {
    final multiply = (neededLength / passwBytes.lengthInBytes).ceil();
    final bb = BytesBuilder();
    for (var i = 0; i < multiply; i++) {
      bb.add(passwBytes);
    }
    passwBytes = bb.toBytes();
  }
  return passwBytes;
}

const _keyLength = 32;
const _ivLength = 8;
const _keyInPercent = _keyLength / (_keyLength + _ivLength);
