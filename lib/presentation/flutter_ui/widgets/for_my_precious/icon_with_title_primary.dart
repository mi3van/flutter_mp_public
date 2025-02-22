import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/service_locator.dart';

const _dividerLineWidth = 1.0;
const _dividerLineHeight = 18.0;
final _dividerVerticalPadding =
    ((IconWithTitlePrimary.height - _dividerLineHeight).toInt() >> 1)
        .toDouble();

class IconWithTitlePrimary extends StatelessWidget {
  IconWithTitlePrimary({
    super.key,
    required this.iconData,
    required this.titleText,
    Color? widgetColor,
  }) : widgetColor = widgetColor ?? defColor;

  static final defColor = ThemePalette.primaryMiddleColor;
  static const height = elementIconSizeRegular;
  static const topPadding = paddingHuge;

  final IconData iconData;
  final String titleText;
  final Color widgetColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        paddingRegular,
        topPadding,
        0.0,
        paddingSmall,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: widgetColor,
            size: height,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingSmall,
              vertical: _dividerVerticalPadding,
            ),
            child: Container(
              width: _dividerLineWidth,
              height: _dividerLineHeight,
              decoration: BoxDecoration(color: widgetColor),
            ),
          ),
          Expanded(
            child: Text(
              titleText,
              style: uiLocator.appController
                  .theme(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: widgetColor),
            ),
          ),
        ],
      ),
    );
  }
}
