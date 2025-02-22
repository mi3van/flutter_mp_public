import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_popup.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/service_locator.dart';

class DataControlWidget extends StatelessWidget with GetItMixin {
  DataControlWidget({super.key});

  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    final isSignedIn = watchX<AuthModelControllerMixin, bool?>(
      (model) => model.isUserSignedInNotifier,
    );

    final isActionAvailable = true;

    final chipBackground =
        ThemePalette.getActionChipBackground(theme, isActionAvailable);

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: paddingSmaller,
      runSpacing: paddingSmaller,
      children: [
        ActionChip(
          label: Text("_locale.importDataTitle"),
          labelStyle: ThemePalette.getActionChipStyle(theme, isActionAvailable),
          labelPadding: const EdgeInsets.symmetric(
            horizontal: paddingForChip,
          ),
          onPressed: () => isActionAvailable
              ? cLocator.appAlertController.showImportDataBtmSheet()
              : HelperPopup.showToastWaitLittle(),
          backgroundColor: chipBackground,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        ActionChip(
          label: Text("_locale.exportDataTitle"),
          labelStyle: ThemePalette.getActionChipStyle(theme, isActionAvailable),
          labelPadding: const EdgeInsets.symmetric(
            horizontal: paddingForChip,
          ),
          onPressed: () => isActionAvailable
              ? cLocator.appAlertController.showExportDataBtmSheet()
              : HelperPopup.showToastWaitLittle(),
          backgroundColor: chipBackground,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        ActionChip(
          label: Text("_locale.userBlockDeleteLocalDataButtonTitle"),
          labelStyle: ThemePalette.getActionChipStyle(
            theme,
            isActionAvailable,
            availableTextColor: theme.colorScheme.error,
          ),
          labelPadding: const EdgeInsets.symmetric(
            horizontal: paddingForChip,
          ),
          onPressed: () => isActionAvailable
              ? uiLocator.appAlertController.onShowDeleteAllLocallyAlert()
              : HelperPopup.showToastWaitLittle(),
          backgroundColor: chipBackground,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        if (isSignedIn == true)
          ActionChip(
            label: Text("_locale.deleteCloudDataButton"),
            labelStyle: ThemePalette.getActionChipStyle(
              theme,
              isActionAvailable,
              availableTextColor: theme.colorScheme.error,
            ),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: paddingForChip,
            ),
            onPressed: () => isActionAvailable
                ? uiLocator.appAlertController.onShowDeleteAllInCloudAlert()
                : HelperPopup.showToastWaitLittle(),
            backgroundColor: chipBackground,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
      ],
    );
  }
}
