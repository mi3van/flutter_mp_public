import 'dart:typed_data';

import 'package:domain/domain.dart';

class User {
  int userId;
  final String dbUserUuid;
  String? nickname;
  Uint8List? avatarPreview;
  String email;
  Role role;
  // Used only for cloud-switch check.
  String? cloudFolderUuid;

  User({
    required this.userId,
    required this.dbUserUuid,
    required this.role,
    required this.email,
  });

  @override
  bool operator ==(other) => identical(this, other)
      ? true
      : other is User &&
          userId == other.userId &&
          dbUserUuid == other.dbUserUuid &&
          nickname == other.nickname &&
          ((avatarPreview == null && other.avatarPreview == null) ||
              avatarPreview!.listEqual(other.avatarPreview!)) &&
          email == other.email &&
          role == other.role &&
          cloudFolderUuid == other.cloudFolderUuid;

  @override
  int get hashCode => Object.hash(
        userId,
        dbUserUuid,
        nickname,
        avatarPreview?.lengthInBytes,
        email,
        role,
        cloudFolderUuid,
      );
}
