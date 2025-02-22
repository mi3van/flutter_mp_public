import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/marquee_text.dart';
import 'package:my_precious/service_locator.dart';

class AvatarDataWithTitleOnSurface extends StatelessWidget {
  const AvatarDataWithTitleOnSurface({
    super.key,
    required this.avatarData,
    required this.title,
    this.subtitle,
  });

  static const double _avatarImageSize = elementHeightRegular;

  final Uint8List? avatarData;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    final avatarWidget = avatarData != null
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
                    avatarData!,
                    fit: BoxFit.cover,
                    width: _avatarImageSize,
                    height: _avatarImageSize,
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
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
                Icon(
                  Icons.account_circle_outlined,
                  color: theme.colorScheme.onSurfaceVariant,
                  size: _avatarImageSize,
                ),
              ],
            ),
          );
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: paddingRegular,
        horizontal: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          avatarWidget,
          const SizedBox(width: paddingSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarqueeWidget(
                  child: Text(
                    title,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 2.0),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: ThemePalette.secondaryMiddleColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
