import 'package:flutter/material.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/marquee_text.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/drawer/drawer_main_list.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/service_locator.dart';

class DrawerButtonWidget extends StatelessWidget {
  const DrawerButtonWidget({
    super.key,
    required this.title,
    required this.leadingWidget,
    required this.padding,
    required this.textPadding,
    required this.onPressed,
    required this.tooltip,
    this.onLongPress,
    this.isSelected = false,
  });

  final String title;
  final Widget leadingWidget;
  final EdgeInsetsGeometry padding;
  final double textPadding;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final bool isSelected;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    final backgroundColor =
        isSelected ? theme.colorScheme.secondaryContainer : Colors.transparent;

    return PreciousTooltip(
      message: tooltip,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: DrawerMainList.itemHeight,
          maxHeight: DrawerMainList.itemHeight,
          maxWidth: DrawerMainList.maxWidth,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: padding,
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed,
          onLongPress: onLongPress,
          child: Row(
            children: [
              leadingWidget,
              SizedBox(width: textPadding),
              Expanded(
                child: MarqueeWidget(
                  child: Text(
                    title,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
