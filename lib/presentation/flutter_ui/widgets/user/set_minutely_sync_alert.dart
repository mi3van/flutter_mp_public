import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/event_handler/platform_alert_event_handler/material_alert_event_handler.dart';
import 'package:my_precious/presentation/flutter_ui/common/alert_dialog/dialog_text_buttons.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/alert_text_content.dart';
import 'package:my_precious/service_locator.dart';

class SetMinutelySyncAlertDialog extends StatelessWidget {
  const SetMinutelySyncAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        scrollable: true,
        alignment: Alignment.center,
        title: Text(
          "uiLocator.localesController.locale.warningTitle",
          style: uiLocator.appController.theme(context).textTheme.titleLarge,
        ),
        content: AlertTextContent(
          "uiLocator.localesController.locale.alertDescrMinutelySyncRecommended",
        ),
        actions: [
          const DialogCancelTextButton(),
          DialogSetUpNowTextButton(
            onPressed: () => {
              uiLocator.alertEventHandler.hideCurrentAlert(context),
              uiLocator.settingsController
                  .updateSyncFrequency(SyncFrequencyType.minutely)
            },
          )
        ],
        titlePadding: MaterialAlertEventHandler.titlePadding,
        contentPadding: MaterialAlertEventHandler.contentPadding,
        actionsPadding: MaterialAlertEventHandler.actionsPadding,
        insetPadding: MaterialAlertEventHandler.insetPadding,
      ),
    );
  }
}
