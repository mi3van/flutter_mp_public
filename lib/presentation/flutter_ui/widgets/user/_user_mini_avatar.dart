import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/user_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

class UserMiniAvatar extends StatelessWidget with GetItMixin {
  static const double _avatarImageSize = elementHeightRegular;
  static const double _avatarIconSize = elementIconSizeRegular;
  static final double avatarDiff =
      ((_avatarImageSize - _avatarIconSize).toInt() >> 1).toDouble();

  UserMiniAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final originalUser =
        watchX((UserModelControllerMixin model) => model.originalUserNotifier);

    final isAvatarExist = originalUser.avatarPreview != null;

    return isAvatarExist
        ? SizedBox(
            height: _avatarImageSize,
            width: _avatarImageSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: uiLocator.appController.palette.surface[3],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(_avatarImageSize),
                  child: Image.memory(
                    originalUser.avatarPreview!,
                    fit: BoxFit.cover,
                    width: _avatarImageSize,
                    height: _avatarImageSize,
                    gaplessPlayback: true,
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: avatarDiff),
            height: _avatarIconSize,
            width: _avatarIconSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: uiLocator.appController.palette.surface[3],
                  ),
                ),
                Icon(
                  Icons.self_improvement_rounded,
                  color: uiLocator.appController
                      .theme(context)
                      .colorScheme
                      .onSurfaceVariant,
                  size: _avatarIconSize,
                ),
              ],
            ),
          );
  }
}

// class _FirstSymbolOfNickname extends StatelessWidget with GetItMixin {
//   _FirstSymbolOfNickname({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const testNickname = 'Belovan';

//     return Text(
//       getTextFirstSymbols(testNickname),
//       style: uiLocator.appController.theme(context).textTheme.titleMedium?.copyWith(height: 0),
//     );
//   }
// }
