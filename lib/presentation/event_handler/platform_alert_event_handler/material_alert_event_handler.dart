import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/event_handler/alert_event_handler_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/alert_dialog/dialog_text_buttons.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/divider_in_column.dart';
import 'package:my_precious/service_locator.dart';

class MaterialAlertEventHandler implements AlertEventHandlerMixin {
  @override
  Future<void> showRegularAlert(BuildContext context, Alert alert) =>
      _showRegularAlert(
        context,
        alert,
        Text(alert.message),
      );

  @override
  Future<void> showBaseExceptionCodeAlert(
    BuildContext context,
    BaseExceptionAlert baseExceptionAlert,
  ) async {
    final localizedException = cLocator.localesController
        .getBaseExceptionMessage(baseExceptionAlert.baseException);
    return _showRegularAlert(
      context,
      baseExceptionAlert,
      Text(localizedException),
    );
  }

  @override
  Future<void> showActionAlert(
    BuildContext context,
    ActionAlert actionAlert,
  ) async {
    final List<SimpleDialogOption> items = [];
    if (actionAlert.description != null) {
      items.addAll(_getAlertDescriptionWidget(
        context,
        actionAlert.description!,
      ));
    }
    items.addAll(buildDialogActions(
      context,
      uiLocator.appController.theme(context).textTheme.bodyMedium,
      actionAlert.actions,
    ));

    SimpleDialog alertDialog = SimpleDialog(
      title: Text(actionAlert.title),
      titlePadding: titlePadding,
      insetPadding: insetPadding,
      clipBehavior: Clip.hardEdge,
      children: items,
    );

    await showDialog(
      context: context,
      builder: (_) => alertDialog,
      useRootNavigator: false,
      barrierColor: genAlertBarrierDefColor,
    );
  }

  @override
  Future<void> showActionAlertCode(
    BuildContext context,
    ActionAlertWithCode actionAlertWithCode,
  ) async {
    final List<SimpleDialogOption> items = [];
    if (actionAlertWithCode.descriptionCode != null) {
      final description = cLocator.localesController.getAlertActionTitle(
        actionAlertWithCode.descriptionCode!,
        descriptionAddon: actionAlertWithCode.title,
      );
      items.addAll(_getAlertDescriptionWidget(context, description));
    }
    items.addAll(buildDialogActions(
      context,
      uiLocator.appController.theme(context).textTheme.bodyMedium,
      actionAlertWithCode.actions
          .map((action) => AlertActionData(
                action: action.action,
                title: cLocator.localesController.getAlertActionTitle(
                  action.titleCode,
                  descriptionAddon: actionAlertWithCode.title,
                ),
              ))
          .toList(),
    ));
    final title = cLocator.localesController.getAlertActionTitle(
      actionAlertWithCode.titleCode,
      descriptionAddon: actionAlertWithCode.title,
    );
    SimpleDialog alertDialog = SimpleDialog(
      title: Text(title),
      titlePadding: titlePadding,
      insetPadding: insetPadding,
      children: items,
    );

    await showDialog(
      context: context,
      barrierDismissible: actionAlertWithCode.isAlertDismissible,
      builder: (_) => PopScope(
        canPop: actionAlertWithCode.isAlertDismissible,
        child: alertDialog,
      ),
      useRootNavigator: false,
      barrierColor: genAlertBarrierDefColor,
    );
  }

  @override
  Future<void> showGeneralAlert(
    BuildContext context,
    GeneralAlert<RoutePageBuilder> generalAlert,
  ) async {
    await showGeneralDialog(
      context: context,
      pageBuilder: generalAlert.pageBuilder,
      barrierLabel: generalAlert.barrierLabel,
      barrierDismissible: generalAlert.barrierDismissible ?? false,
      barrierColor: generalAlert.barrierColor ?? genAlertBarrierDefColor,
      useRootNavigator: false,
    );
  }

  @override
  void hideCurrentAlert(BuildContext context) => _hideAlert(context);

  static void _hideAlert(BuildContext context) =>
      Navigator.of(context).pop('dialog');

  @override
  Future<void> showSnackBar(
    BuildContext context,
    String message,
    Duration duration,
  ) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final scaffold = ScaffoldMessenger.of(context);

    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
      ),
    );
  }

  @override
  Future<void> showBottomSheet(BuildContext context, bottomSheet) async {
    if (bottomSheet is BottomSheetMixin<WidgetBuilder>) {
      return showModalBottomSheet(
        context: context,
        builder: bottomSheet.builder,
        useSafeArea: true,
        isScrollControlled: true,
      );
    }
  }

  List<SimpleDialogOption> _getAlertDescriptionWidget(
    BuildContext context,
    String description,
  ) {
    return [
      SimpleDialogOption(
        padding: const EdgeInsets.fromLTRB(
          _alertDefaultPadding,
          paddingSmaller,
          _alertDefaultPadding,
          paddingMicro,
        ),
        child: Text(
          description,
          style: uiLocator.appController
              .theme(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ThemePalette.secondaryMiddleColor),
        ),
      ),
      SimpleDialogOption(
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: paddingRegular,
        ),
        child: DividerInColumn(
          verticalPadding: paddingSmaller,
          color: uiLocator.appController.palette.secondary[70],
        ),
      ),
    ];
  }

  static get insetPadding => const EdgeInsets.all(paddingRegular);

  static get titlePadding =>
      const EdgeInsets.fromLTRB(paddingHuge, paddingRegular, paddingHuge, 0);

// Used for general alerts
  static get actionsPadding =>
      const EdgeInsets.fromLTRB(paddingHuge, 0.0, paddingHuge, paddingSmall);

  static get contentPadding => const EdgeInsets.all(paddingSmall);

  static get contentAsTitlePadding => const EdgeInsets.fromLTRB(
      paddingHuge, paddingRegular, paddingHuge, paddingSmaller);

  static const _alertDefaultPadding = 24.0;

  static getBtmSheetKeybPadding(BuildContext context) => EdgeInsets.fromLTRB(
      paddingRegular,
      paddingSmall,
      paddingRegular,
      MediaQuery.of(context).viewInsets.bottom + paddingSmall);

  static List<SimpleDialogOption> buildDialogActions(
    BuildContext context,
    TextStyle? textStyle,
    List<AlertActionData> actionsData,
  ) {
    List<SimpleDialogOption> actionWidgets = [];

    for (var data in actionsData) {
      actionWidgets.add(
        SimpleDialogOption(
          child: Text(
            data.title,
            style: textStyle,
          ),
          onPressed: () {
            _hideAlert(context);
            if (data.action != null) data.action!();
          },
        ),
      );
    }

    return actionWidgets;
  }

  Future<void> _showRegularAlert(
    BuildContext context,
    AlertMixin alert,
    Widget messageBody,
  ) async {
    final title =
        alert.title ?? cLocator.localesController.getAlertTypeTitle(alert.type);

    // set up the AlertDialog
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: messageBody,
      scrollable: true,
      actions: const [DialogOkTextButton()],
    );

    await showDialog(
      context: context,
      builder: (_) => alertDialog,
      useRootNavigator: false,
      barrierColor: genAlertBarrierDefColor,
    );
  }
}
