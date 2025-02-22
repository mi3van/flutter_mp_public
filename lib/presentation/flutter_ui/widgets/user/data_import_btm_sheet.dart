import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/event_handler/platform_alert_event_handler/material_alert_event_handler.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/marquee_text.dart';
import 'package:my_precious/service_locator.dart';

class ImportDataBottomSheet extends StatelessWidget {
  const ImportDataBottomSheet({super.key});

  AppLocale get _locale => uiLocator.localesController.locale;
  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: MaterialAlertEventHandler.getBtmSheetKeybPadding(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MarqueeWidget(
            child: Text(
              "_locale.importDataTitle",
              style: textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: paddingRegular),
          Text(
            "uiLocator.localesController.locale.importDataAllDeletionWarning",
            style: textTheme.labelLarge?.copyWith(color: colorScheme.error),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: paddingSmaller),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: paddingMicro,
            ),
            // child: PasswordTextField(
            //   uiLocator.userModel.passwImportFieldController,
            //   disposeFun: uiLocator.userController.cleanAfterImportSheetClose,
            // ),
          ),
          const SizedBox(height: paddingSmaller),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: colorScheme.onSurfaceVariant,
                    backgroundColor: colorScheme.primaryContainer,
                  ),
                  onPressed: () => uiLocator.userController
                      .onImportClick()
                      .then((isImported) {
                    if (isImported) {
                      // ignore: use_build_context_synchronously
                      uiLocator.navigationController.onCloseUntilRoot(context);
                    }
                  }),
                  child: Text(
                    "uiLocator.localesController.locale.importSelectBackupTitle",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
