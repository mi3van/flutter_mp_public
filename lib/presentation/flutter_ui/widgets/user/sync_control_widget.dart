import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/user_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_popup.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/service_locator.dart';

class SynchronizationControlWidget extends StatelessWidget with GetItMixin {
  SynchronizationControlWidget({super.key});

  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    final isAuthLoading =
        watchX((AuthModelControllerMixin model) => model.isAuthLoadingNotifier);
    final isUserLoadng =
        watchX((UserModelControllerMixin model) => model.isUserLoadingNotifier);

    final isActionAvailable = !isAuthLoading && !isUserLoadng;

    final chipTextStyle =
        ThemePalette.getActionChipStyle(theme, isActionAvailable);
    final chipBackground =
        ThemePalette.getActionChipBackground(theme, isActionAvailable);

    final originalUserEmail = uiLocator.userModel.originalUserEmail;

    final selectedUserEmail = _getSelectedUserEmailForUi();

    return AnimatedSize(
      duration: animationDurationFast,
      curve: Curves.easeIn,
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          if (originalUserEmail != null)
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: PreciousTooltip(
                      message:
                          uiLocator.platformUiController.marketUi.cloudName,
                      child: uiLocator.platformUiController.marketUi
                          .getCloudIconWidget(),
                    ),
                  ),
                  TextSpan(
                    text: "_locale.userPageSyncSignedInAs($originalUserEmail)",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          if (selectedUserEmail != null)
            Padding(
              padding: const EdgeInsets.only(top: paddingSmaller),
              child: Text(
                "_locale.userPageSyncSelectedEmail($selectedUserEmail)",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          const SizedBox(height: 6.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: paddingSmaller,
            runSpacing: paddingSmaller,
            children: [
              ActionChip(
                label: Text("_locale.startSync"),
                labelStyle: chipTextStyle,
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: paddingForChip,
                ),
                onPressed: HelperPopup.showToastWaitLittle,
                backgroundColor: chipBackground,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              ActionChip(
                label: Text("_locale.exitTheCloud"),
                labelStyle: chipTextStyle,
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: paddingForChip,
                ),
                onPressed: () => isActionAvailable
                    ? uiLocator.authController.exitCloud()
                    : HelperPopup.showToastWaitLittle(),
                backgroundColor: chipBackground,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String? _getSelectedUserEmailForUi() {
  return uiLocator.userModel.isSelUserIsOrig
      // Null need to exclude "selected user" text widget.
      ? null
      : uiLocator.userModel.selectedUserNotifier.value?.email;
}
