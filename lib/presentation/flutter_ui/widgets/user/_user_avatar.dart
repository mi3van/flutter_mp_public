import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/user_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

class UserAvatar extends StatelessWidget with GetItMixin {
  UserAvatar({super.key});

  static const _widgetSize = elementHeightHuge;

  @override
  Widget build(BuildContext context) {
    final originalUser =
        watchX((UserModelControllerMixin model) => model.originalUserNotifier);

    return SizedBox(
      height: _widgetSize,
      width: _widgetSize,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: uiLocator.appController.palette.surface[3],
            ),
          ),
          if (originalUser.avatarPreview != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(_widgetSize),
              child: Image.memory(
                originalUser.avatarPreview!,
                fit: BoxFit.cover,
                width: _widgetSize,
                height: _widgetSize,
                gaplessPlayback: true,
              ),
            ),
        ],
      ),
    );
  }
}
