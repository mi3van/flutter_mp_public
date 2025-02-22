import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_popup.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/service_locator.dart';

class CloudSelectionWidget extends StatelessWidget with GetItMixin {
  CloudSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    final isAuthAvailable = !watchX(
        (AuthModelControllerMixin model) => model.isAuthLoadingNotifier);

    return Column(
      children: [
        Text(
          "uiLocator.localesController.locale.chooseCloudForSync",
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: ThemePalette.secondaryMiddleColor,
            fontStyle: FontStyle.italic,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: paddingMicro),
          child: ActionChip(
            label:
                uiLocator.platformUiController.marketUi.getCloudConnectWidget(),
            labelStyle: ThemePalette.getActionChipStyle(theme, isAuthAvailable),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: paddingForChip,
            ),
            onPressed: isAuthAvailable
                ? () => uiLocator.platformUiController.marketUi.cloudNameClick()
                //  uiLocator.authController.signInToCloudAndTrySync(locale)
                : HelperPopup.showToastWaitLittle,
            backgroundColor:
                ThemePalette.getActionChipBackground(theme, isAuthAvailable),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
