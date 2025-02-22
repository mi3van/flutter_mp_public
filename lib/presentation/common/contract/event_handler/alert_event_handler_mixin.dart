import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

mixin AlertEventHandlerMixin {
  Future<void> showRegularAlert(
    BuildContext context,
    Alert alert,
  );

  Future<void> showBaseExceptionCodeAlert(
    BuildContext context,
    BaseExceptionAlert baseExceptionAlert,
  );

  Future<void> showActionAlert(
    BuildContext context,
    ActionAlert actionAlert,
  );

  Future<void> showActionAlertCode(
    BuildContext context,
    ActionAlertWithCode actionAlertWithCode,
  );

  Future<void> showGeneralAlert(
    BuildContext context,
    GeneralAlert<RoutePageBuilder> generalAlert,
  );

  void hideCurrentAlert(BuildContext context);

  Future<void> showSnackBar(
    BuildContext context,
    String message,
    Duration duration,
  );

  Future<void> showBottomSheet(
    BuildContext context,
    BottomSheetMixin bottomSheet,
  );
}
