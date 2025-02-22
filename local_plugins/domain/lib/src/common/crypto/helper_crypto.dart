import 'dart:convert';
import 'dart:typed_data';

import 'package:domain/src/common/crypto/buffer.dart';

part "_base_hash.dart";
part "_digest.dart";
part "_md5.dart";
part "_utils.dart";

abstract class HelperCrypto {
  static BaseHash get md5 => _md5;
}
