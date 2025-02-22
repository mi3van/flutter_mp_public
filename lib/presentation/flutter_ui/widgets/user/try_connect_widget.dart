import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_popup.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/service_locator.dart';

class TryConnectWidget extends StatelessWidget with GetItMixin {
  TryConnectWidget({super.key});

  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    final isAuthLoading =
        watchX((AuthModelControllerMixin model) => model.isAuthLoadingNotifier);

    final isActionAvailable = !isAuthLoading;

    final chipTextStyle =
        ThemePalette.getActionChipStyle(theme, isActionAvailable);
    final chipBackground =
        ThemePalette.getActionChipBackground(theme, isActionAvailable);

    return Column(
      children: [
        Text("_locale.userPageConnectNowDescription",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: ThemePalette.secondaryMiddleColor,
              fontStyle: FontStyle.italic,
            )),
        const SizedBox(height: 6.0),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: paddingSmaller,
          runSpacing: paddingSmaller,
          children: [
            ActionChip(
              label: Text("_locale.connectNowButtonTitle"),
              labelStyle: chipTextStyle,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: paddingForChip,
              ),
              onPressed: isActionAvailable
                  ? uiLocator.authController.tryRestoreAuthByTokensClick
                  : HelperPopup.showToastWaitLittle,
              backgroundColor: chipBackground,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            ActionChip(
              label: Text("_locale.exitTheCloud"),
              labelStyle: chipTextStyle,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: paddingForChip,
              ),
              onPressed: isActionAvailable
                  ? () => uiLocator.authController.exitCloud()
                  : HelperPopup.showToastWaitLittle,
              backgroundColor: chipBackground,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ],
    );
  }
}
