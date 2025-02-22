import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/marquee_text.dart';
import 'package:my_precious/service_locator.dart';

class IconWithTitleOnSurface extends StatelessWidget {
  const IconWithTitleOnSurface({
    super.key,
    required this.iconData,
    required this.title,
    this.subtitle,
    this.onTap,
    this.onLongPress,
  });

  final IconData iconData;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);
    final widgetColor = theme.colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(borderRadiusRegular),
      child: Padding(
        padding: const EdgeInsets.all(paddingRegular),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              iconData,
              color: widgetColor,
              size: elementHeightSmaller,
            ),
            const SizedBox(width: paddingSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarqueeWidget(
                    child: Text(
                      title,
                      style: theme.textTheme.labelLarge
                          ?.copyWith(color: widgetColor, height: 0),
                    ),
                  ),
                  const SizedBox(height: paddingMicro),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: ThemePalette.secondaryMiddleColor,
                        height: 0,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
