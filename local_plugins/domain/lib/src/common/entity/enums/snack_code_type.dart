import 'package:domain/src/common/const.dart';

enum SnackbarCodeType {
  signInFailed(snackBarDurationSlow),
  restoreAuthFailed(snackBarDurationSlow),
  failedToSync(snackBarDurationFast),
  internetRequired(snackBarDurationFast),
  waitLittle(snackBarDurationFast),
  unableCloudConnect(snackBarDurationRegular),
  userMustBeAuthorized(snackBarDurationSlow),
  userNotFound(snackBarDurationRegular),
  successfullyCompleted(snackBarDurationFast),
  itemDeletionError(snackBarDurationRegular),
  noScanResult(snackBarDurationRegular),
  syncRequired(snackBarDurationRegular),
  ;

  final Duration duration;

  const SnackbarCodeType(this.duration);
}
