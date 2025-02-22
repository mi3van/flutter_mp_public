import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/model_controller/app_alert_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart'
    show AppLocale, genAlertBarrierLightColor;
import 'package:my_precious/presentation/flutter_ui/widgets/settings/items_sort_mode_alert.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/data_export_btm_sheet.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/data_import_btm_sheet.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/set_minutely_sync_alert.dart';
import 'package:my_precious/service_locator.dart';

class AppAlertController implements AppAlertModelControllerMixin {
  @override
  late final currentAlertNotifier = ValueNotifier<AlertMixin?>(null);
  @override
  late final currentSnackBarNotifier = ValueNotifier<SnackbarMixin?>(null);
  @override
  late final currentBtmSheetNotifier = ValueNotifier<BottomSheetMixin?>(null);

  AppLocale get _locale => cLocator.localesController.locale;

  @override
  void showExceptionMessageAlert(exceptionMessage) {
    _setAlertToShow(Alert(message: exceptionMessage, type: AlertType.error));
  }

  @override
  void showExceptionAlert(baseException) {
    _setAlertToShow(ErrorAlert(baseException));
  }

  @override
  void showInfoAlert(baseException) {
    _setAlertToShow(InfoAlert(baseException));
  }

  @override
  void showWarningAlert(baseException) {
    _setAlertToShow(WarningAlert(baseException));
  }

  @override
  void showActionAlertCode(
    List<AlertActionCodeData> actions, {
    ActionAlertTextCode? descriptionCode,
    String? descriptionAddon,
    bool isAlertDismissible = false,
  }) {
    _setAlertToShow(ActionAlertWithCode(
      titleCode: ActionAlertTextCode.actionRequiredTitle,
      descriptionCode: descriptionCode,
      actions: actions,
      title: descriptionAddon ?? "",
      isAlertDismissible: isAlertDismissible,
    ));
  }

  void _setAlertToShow(AlertMixin alert) {
    currentAlertNotifier.value = alert;
    currentAlertNotifier.value = null;
  }

  @override
  void showSnackBar(String mesg) => _setSnackbarToShow(SnackbarRegular(mesg));

  @override
  void showSnackBarFast(String mesg) => _setSnackbarToShow(SnackbarFast(mesg));

  @override
  void showSnackBarCode(snckCode) => _setSnackbarToShow(SnackbarCode(snckCode));

  void _setSnackbarToShow(SnackbarMixin snackbar) {
    currentSnackBarNotifier.value = snackbar;
    currentSnackBarNotifier.value = null;
  }

  @override
  void showImportDataBtmSheet() {
    _setBtmSheetToShow((_) => const ImportDataBottomSheet());
  }

  @override
  void showExportDataBtmSheet() {
    _setBtmSheetToShow((_) => const ExportDataBottomSheet());
  }

  void _setBtmSheetToShow(WidgetBuilder widgetBuilder) {
    currentBtmSheetNotifier.value = BtmSheetData<WidgetBuilder>(widgetBuilder);
    currentBtmSheetNotifier.value = null;
  }

  // Typed alerts.

  @override
  void onShowDeleteAllLocallyAlert() {
    final description = cLocator.authModel.isUserSignedInNotifier.value == true
        ? "_locale.userBlockDeleteLocalDataAlertDescription"
        : "_locale.userBlockDeleteMyLocalDataAlertDescription";

    _showActionAlert(
      "_locale.userBlockDeleteLocalDataAlertTitle",
      description: description,
      [
        AlertActionData(
          title: "_locale.yesDelete",
          action: cLocator.userController.deleteSelectedAllStorageData,
        ),
        AlertActionData(
          title: "_locale.no",
        ),
      ],
    );
  }

  @override
  void onShowDeleteAllInCloudAlert() {
    if (cLocator.userModel.originalUserEmail != null) {
      _showActionAlert(
        "_locale.userBlockDeleteCloudDataAlertTitle",
        description: "_locale.userBlockDeleteCloudDataAlertDescription",
        [
          AlertActionData(
            title: "_locale.yesDelete",
            action: cLocator.userController.deleteOriginalAllCloudData,
          ),
          AlertActionData(
            title: "_locale.no",
          ),
        ],
      );
    }
  }

  @override
  void onShowSetMinutelySyncAlert() {
    _showGenDialgNoDsmss(
      (_, __, ___) => const SetMinutelySyncAlertDialog(),
    );
  }

  @override
  void onShowSortModeAlert() {
    _showGenDialgDismiss(
      (_, __, ___) => const ItemsSortModeAlertDialog(),
      barrierCol: genAlertBarrierLightColor,
    );
  }

  void _showGenDialgNoDsmss(RoutePageBuilder pageBuilder, {Color? barrierCol}) {
    _setAlertToShow(GeneralAlert<RoutePageBuilder>(
      pageBuilder: pageBuilder,
      // Default color is genAlertBarrierDefColor.
      barrierColor: barrierCol,
    ));
  }

  void _showGenDialgDismiss(RoutePageBuilder pageBuilder, {Color? barrierCol}) {
    _setAlertToShow(GeneralAlert<RoutePageBuilder>(
      pageBuilder: pageBuilder,
      barrierDismissible: true,
      barrierLabel: "_locale.btnTitleComplete",
      // Default color is genAlertBarrierDefColor.
      barrierColor: barrierCol,
    ));
  }

  void _showActionAlert(
    String title,
    List<AlertActionData> actions, {
    description,
  }) {
    _setAlertToShow(ActionAlert(
      title: title,
      actions: actions,
      description: description,
    ));
  }
}
