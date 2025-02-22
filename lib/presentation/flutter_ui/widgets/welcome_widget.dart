import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets//basic/divider_in_column.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/marquee_text.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/bottom_bar/fab_precious.dart';
import 'package:my_precious/service_locator.dart';

const _imageSize = 160.0;

class WelcomeWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;
  final bool isFabBig;
  final double fabBottomPaddingSize;

  const WelcomeWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
    this.isFabBig = false,
  }) : fabBottomPaddingSize = isFabBig == true
            ? paddingRegular
            : paddingRegular +
                (PreciousFAB.bigSize - PreciousFAB.defaultSize) / 2;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(paddingRegular),
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(paddingHuge),
                  child: Image.asset(
                    imagePath,
                    width: _imageSize,
                    height: _imageSize,
                    fit: BoxFit.contain,
                    color: color,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
              ),
              Center(
                child: MarqueeWidget(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style:
                        theme.textTheme.displayMedium?.copyWith(color: color),
                  ),
                ),
              ),
              DividerInColumn(
                  color: color, verticalPadding: elementHeightSmall),
              Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(color: color),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            paddingRegular,
            paddingRegular,
            paddingRegular,
            fabBottomPaddingSize,
          ),
          child: PreciousFAB(
            onPressed: onTap,
            iconData: Icons.arrow_forward_rounded,
            isFabBig: isFabBig,
            tooltip: uiLocator.localesController.localeM.continueButtonLabel,
          ),
        ),
      ],
    );
  }
}
