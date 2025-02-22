import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart' show JustTheController;
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_popup.dart';

class PreciousTooltip extends StatelessWidget {
  const PreciousTooltip({
    super.key,
    required this.message,
    required this.child,
    this.controller,
  });

  final Widget child;
  final String message;
  final JustTheController? controller;

  @override
  Widget build(BuildContext context) {
    return HelperPopup.getTooltipDefault(
      context,
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: tooltipMaxSize,
        ),
        child: Text(
          message,
          style: HelperPopup.getTooltipTextStyle(context),
          textAlign: TextAlign.center,
        ),
      ),
      child: child,
      controller: controller,
    );
  }
}
