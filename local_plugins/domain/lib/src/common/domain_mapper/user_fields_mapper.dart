import 'dart:typed_data';

import 'package:domain/src/common/entity/dto/user/cloud_user.dart';
import 'package:domain/src/common/entity/dto/user/user.dart';

abstract class UserFieldsMapper {
  static void setFields({
    required User target,
    required CloudUser newInfo,
    required Uint8List? avatar,
  }) {
    target
      ..nickname = newInfo.nickname
      ..avatarPreview = avatar
      ..role = newInfo.role
      ..email = newInfo.email
      ..cloudFolderUuid = newInfo.cloudFolderUuid;
  }
}
