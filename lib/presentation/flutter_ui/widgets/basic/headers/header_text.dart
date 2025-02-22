import 'package:flutter/material.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/headers/header_widget.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/marquee_text.dart';
import 'package:my_precious/service_locator.dart';

class HeaderText extends StatelessWidget {
  final String title;
  final AlignmentGeometry align;
  final double height;
  final double horizontalPadding;

  const HeaderText({
    super.key,
    required this.title,
    required this.align,
    this.height = double.infinity,
    this.horizontalPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    return HeaderWidget(
      height: height,
      align: align,
      horizontalPadding: horizontalPadding,
      headerChild: MarqueeWidget(
        child: Text(
          title.toUpperCase(),
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
