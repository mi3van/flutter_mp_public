import 'package:domain/domain.dart';

mixin AppAlertControllerMixin implements _TypdAlertControllerMixin {
  void showExceptionMessageAlert(String exceptionMessage);

  void showExceptionAlert(BaseException baseException);

  void showInfoAlert(BaseException baseException);

  void showWarningAlert(BaseException baseException);

  void showActionAlertCode(
    List<AlertActionCodeData> actions, {
    ActionAlertTextCode? descriptionCode,
    String descriptionAddon,
    bool isAlertDismissible, // false by default.
  });

// Localized messages at this point.
  void showSnackBar(String message);

  void showSnackBarFast(String message);

  void showSnackBarCode(SnackbarCodeType snackCode);

  void showImportDataBtmSheet();

  void showExportDataBtmSheet();
}

mixin _TypdAlertControllerMixin {
  void onShowDeleteAllLocallyAlert();
  void onShowDeleteAllInCloudAlert();

  void onShowSetMinutelySyncAlert();

  void onShowSortModeAlert();

  // void onShowRestartAppAlert();
}
