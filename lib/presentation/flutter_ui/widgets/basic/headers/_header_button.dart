import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    super.key,
    required this.iconWidget,
    required this.onPressed,
  });

  final Widget iconWidget;
  final void Function(BuildContext context) onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(context),
      icon: iconWidget,
      color: uiLocator.appController.theme(context).colorScheme.tertiary,
      splashRadius: buttonSplashRadius,
    );
  }
}
