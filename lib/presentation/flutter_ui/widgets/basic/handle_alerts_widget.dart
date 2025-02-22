import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/app_alert_model_controller_mixin.dart';
import 'package:my_precious/service_locator.dart';

class HandleAlertsWidget extends StatelessWidget with GetItMixin {
  HandleAlertsWidget({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) => child;

  @override
  StatelessElement createElement() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initHandlers(this);
    });
    return super.createElement();
  }

  void _initHandlers(GetItMixin getItMixin) {
    // Register observers for showing alerts.
    getItMixin.registerHandler<AppAlertModelControllerMixin, AlertMixin?>(
      (alertModel) => alertModel.currentAlertNotifier,
      (context, alert, _) async {
        if (alert != null) return _showAlert(context, alert);
      },
    );

    getItMixin.registerHandler<AppAlertModelControllerMixin, SnackbarMixin?>(
      (alertModel) => alertModel.currentSnackBarNotifier,
      (context, snackBar, _) async {
        if (snackBar != null) return _showSnackBar(context, snackBar);
      },
    );

    getItMixin.registerHandler<AppAlertModelControllerMixin, BottomSheetMixin?>(
      (alertModel) => alertModel.currentBtmSheetNotifier,
      (context, btmSheet, _) async {
        if (btmSheet != null) {
          return uiLocator.alertEventHandler.showBottomSheet(context, btmSheet);
        }
      },
    );
  }

  Future<void> _showAlert(BuildContext context, AlertMixin alert) async {
    if (alert is ActionAlert) {
      return uiLocator.alertEventHandler.showActionAlert(context, alert);
    } else if (alert is BaseExceptionAlert) {
      return uiLocator.alertEventHandler
          .showBaseExceptionCodeAlert(context, alert);
    } else if (alert is GeneralAlert<RoutePageBuilder>) {
      return uiLocator.alertEventHandler.showGeneralAlert(context, alert);
    } else if (alert is Alert) {
      return uiLocator.alertEventHandler.showRegularAlert(context, alert);
    } else if (alert is ActionAlertWithCode) {
      return uiLocator.alertEventHandler.showActionAlertCode(context, alert);
    }
  }

  Future<void> _showSnackBar(context, SnackbarMixin snackbar) async {
    if (snackbar is SnackbarRegular) {
      return uiLocator.alertEventHandler
          .showSnackBar(context, snackbar.message, snackBarDurationRegular);
    } else if (snackbar is SnackbarFast) {
      return uiLocator.alertEventHandler
          .showSnackBar(context, snackbar.message, snackBarDurationFast);
    } else if (snackbar is SnackbarCode) {
      final m = uiLocator.localesController.localizeSnackbarCode(snackbar.type);
      return uiLocator.alertEventHandler
          .showSnackBar(context, m, snackbar.type.duration);
    }
  }
}
