import 'package:data/src/common/entity/isar_dto/db_basic_dto.dart';
import 'package:data/src/common/entity/isar_dto/db_user_private_data.dart';
import 'package:data/src/common/entity/isar_dto/db_user_settings.dart';
import 'package:isar/isar.dart';

part 'db_user.g.dart';

@Collection()
class DbUser extends DbBasicDto {
  late Id id;
  @Index(unique: true)
  late final String userPathUuid;
  String? nickname;
  List<int>? avatarPreview;
  final IsarLink<DbUserPrivateData> userPrivateDataLink;
  final IsarLink<DbUserSettings> userSettingsLink;

  @Index(unique: true)
  late final String email;
  @Index()
  String? role;
  String? rootFolderUuid;

  DbUser({
    IsarLink<DbUserPrivateData>? dbUserPrivateDataLink,
    IsarLink<DbUserSettings>? dbUserSettingsLink,
    int? dbId,
  })  : userPrivateDataLink =
            dbUserPrivateDataLink ?? IsarLink<DbUserPrivateData>(),
        userSettingsLink = dbUserSettingsLink ?? IsarLink<DbUserSettings>() {
    id = dbId ?? dbAutoId;
  }
}
