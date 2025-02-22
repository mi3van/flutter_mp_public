import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/service_locator.dart';

class NoSomeYetWidget extends StatelessWidget {
  final String title;
  const NoSomeYetWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(paddingRegular),
        child: Text(
          title,
          style: uiLocator.appController
              .theme(context)
              .textTheme
              .bodyLarge
              ?.copyWith(
                color: ThemePalette.secondaryMiddleColor,
                height: 0,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
