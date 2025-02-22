import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/service_locator.dart';

class PreciousFAB extends StatelessWidget {
  static const defaultSize = elementHeightBig;
  static const bigSize = 96.0;
  final double _fabSize;
  final double _fabBorderRadius;
  final double _iconSize;
  final Color? backgroundColor;
  final JustTheController? tooltipController;

  const PreciousFAB({
    super.key,
    required this.onPressed,
    this.onLongPress,
    required this.iconData,
    required this.tooltip,
    this.widgetFabElevation = elevationRegular,
    this.widgetFabClickedElevation = elevationRegularClicked,
    bool isFabBig = false,
    this.backgroundColor,
    this.tooltipController,
  })  : _fabSize = isFabBig ? bigSize : defaultSize,
        _fabBorderRadius = isFabBig ? 28.0 : fabBorderRadius,
        _iconSize = isFabBig ? elementIconSizeBig : elementIconSizeRegular;

  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final IconData iconData;
  final String tooltip;
  final double widgetFabElevation;
  final double widgetFabClickedElevation;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    return PreciousTooltip(
      message: tooltip,
      controller: tooltipController,
      child: GestureDetector(
        onLongPress: onLongPress,
        child: SizedBox(
          height: _fabSize,
          width: _fabSize,
          child: FloatingActionButton(
            heroTag: UniqueKey(),
            backgroundColor:
                backgroundColor ?? theme.colorScheme.tertiaryContainer,
            onPressed: onPressed,
            elevation: widgetFabElevation,
            hoverElevation: widgetFabElevation,
            focusElevation: widgetFabClickedElevation,
            highlightElevation: widgetFabClickedElevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_fabBorderRadius),
            ),
            child: Icon(
              iconData,
              size: _iconSize,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }

  static get navigationFabBarShape => const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(fabBarBorderRadius),
          ),
        ),
      );
}
