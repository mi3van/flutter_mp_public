import 'package:flutter/widgets.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/service_locator.dart';

class AlertTextContent extends StatelessWidget {
  const AlertTextContent(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: mobileButtonMaxWidth),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingSmaller),
        child: Text(
          text,
          style: uiLocator.appController
              .theme(context)
              .textTheme
              .bodyMedium
              ?.copyWith(
                color: ThemePalette.secondaryMiddleColor,
              ),
        ),
      ),
    );
  }
}
