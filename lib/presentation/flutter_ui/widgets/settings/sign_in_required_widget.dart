import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_popup.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/service_locator.dart';

class SignInRequiredWidget extends StatelessWidget with GetItMixin {
  SignInRequiredWidget({super.key});

  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    final isAuthAvailable = !watchX<AuthModelControllerMixin, bool>(
      (model) => model.isAuthLoadingNotifier,
    );
    final theme = uiLocator.appController.theme(context);

    return Column(
      children: [
        Text("_locale.signInIsRequiredForSetting",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: ThemePalette.secondaryMiddleColor,
              fontStyle: FontStyle.italic,
            )),
        Padding(
          padding: const EdgeInsets.only(top: paddingMicro),
          child: ActionChip(
            label: Text("_locale.openProfilePage"),
            labelStyle: ThemePalette.getActionChipStyle(theme, isAuthAvailable),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: paddingForChip,
            ),
            onPressed: isAuthAvailable
                ? () => uiLocator.navigationController.userClicked(context)
                : () => HelperPopup.showToastWaitLittle(),
            backgroundColor:
                ThemePalette.getActionChipBackground(theme, isAuthAvailable),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        )
      ],
    );
  }
}
