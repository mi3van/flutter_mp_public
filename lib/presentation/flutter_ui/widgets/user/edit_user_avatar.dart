import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/_user_avatar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/_user_mini_avatar.dart';
import 'package:my_precious/service_locator.dart';

class EditUserAvatar extends StatelessWidget {
  const EditUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: paddingSmall,
      runSpacing: paddingSmall,
      children: [
        UserMiniAvatar(),
        PreciousTooltip(
          message: "uiLocator.localesController.locale.doubleTapForAction:"
              " ${uiLocator.localesController.localeM.deleteButtonTooltip}",
          child: GestureDetector(
            child: UserAvatar(),
          ),
        ),
      ],
    );
  }
}
