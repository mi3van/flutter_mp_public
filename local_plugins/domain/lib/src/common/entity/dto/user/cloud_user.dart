import 'package:domain/src/common/entity/enums/role.dart';

class CloudUser {
  String? nickname;
  String? avatarLink;

  final String email;
  Role role;
  String? cloudFolderUuid;

  CloudUser({
    required this.role,
    required this.email,
  });

  @override
  bool operator ==(other) => identical(this, other)
      ? true
      : other is CloudUser &&
          nickname == other.nickname &&
          avatarLink == other.avatarLink &&
          email == other.email &&
          role == other.role &&
          cloudFolderUuid == other.cloudFolderUuid;

  @override
  int get hashCode => Object.hash(
        nickname,
        avatarLink.hashCode,
        email,
        role,
        cloudFolderUuid,
      );
}
