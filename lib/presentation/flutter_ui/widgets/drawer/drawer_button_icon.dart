import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/marquee_text.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/drawer/drawer_main_list.dart';
import 'package:my_precious/service_locator.dart';

class DrawerMyButtonIcon extends StatelessWidget {
  const DrawerMyButtonIcon({
    super.key,
    required this.title,
    required this.iconData,
    required this.onPressed,
    this.isSelected = false,
  });

  final String title;
  final IconData iconData;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    final backgroundColor =
        isSelected ? theme.colorScheme.secondaryContainer : Colors.transparent;

    return SizedBox(
      height: DrawerMainList.itemHeight,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              iconData,
              color: theme.colorScheme.onSurfaceVariant,
              size: elementIconSizeRegular,
            ),
            const SizedBox(width: paddingSmall),
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
    );
  }
}
