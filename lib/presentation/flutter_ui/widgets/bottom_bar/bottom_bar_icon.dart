import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/service_locator.dart';

class BottomBarIconPadding extends _BaseBottomBarIcon {
  const BottomBarIconPadding({
    super.key,
    required super.iconData,
    required super.onPressed,
    required super.tooltipText,
    required super.horizPadding,
    required super.vertPadding,
    super.color,
    super.isSelected,
  });
}

class BottomBarIcon extends _BaseBottomBarIcon {
  const BottomBarIcon({
    super.key,
    required super.iconData,
    required super.onPressed,
    required super.tooltipText,
    super.color,
    super.isSelected,
  }) : super(horizPadding: paddingSmall, vertPadding: 0.0);
}

abstract class _BaseBottomBarIcon extends StatelessWidget {
  const _BaseBottomBarIcon({
    super.key,
    required this.iconData,
    required this.onPressed,
    required this.tooltipText,
    required this.horizPadding,
    required this.vertPadding,
    this.color,
    this.isSelected = false,
  });

  final IconData iconData;
  final void Function(BuildContext context) onPressed;
  final String tooltipText;
  final Color? color;
  final bool isSelected;
  final double horizPadding;
  final double vertPadding;

  @override
  Widget build(BuildContext context) {
    return PreciousTooltip(
      message: tooltipText,
      child: IconButton(
        icon: Icon(iconData),
        splashRadius: buttonSplashRadius,
        isSelected: isSelected,
        padding: EdgeInsets.symmetric(
          horizontal: horizPadding,
          vertical: vertPadding,
        ),
        iconSize: elementHeightSmaller,
        color: color ??
            uiLocator.appController.theme(context).colorScheme.secondary,
        onPressed: () => onPressed(context),
        selectedIcon: Icon(iconData, color: ThemePalette.primaryMiddleColor),
      ),
    );
  }
}
