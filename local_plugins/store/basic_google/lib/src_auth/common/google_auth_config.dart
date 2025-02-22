import 'package:googleapis/drive/v3.dart';

abstract class GoogleAuthConfig {
  static const cloudSyncScopes = [
    DriveApi.driveScope,
    // DriveApi.driveFileScope,
    // DriveApi.driveAppdataScope,
  ];
}
