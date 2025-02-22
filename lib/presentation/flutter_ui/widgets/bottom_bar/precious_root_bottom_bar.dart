import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/bottom_bar/base_bottom_scroll_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/bottom_bar/bottom_bar_icon.dart';
import 'package:my_precious/service_locator.dart';

class RootBottomBar extends PreciousBaseBottomScrollBar {
  const RootBottomBar({super.key});

  AppLocale get _locale => cLocator.localesController.locale;

  @override
  List<Widget> getBtnWidgets() {
    return [
      BottomBarIcon(
        iconData: Icons.menu_rounded,
        onPressed: (context) {
          uiLocator.navigationController.showDrawerClicked(context);
        },
        tooltipText: cLocator.localesController.localeM.openAppDrawerTooltip,
      ),
      BottomBarIcon(
        iconData: Icons.search_rounded,
        onPressed: (context) {
          uiLocator.navigationController.searchClicked(context);
        },
        tooltipText: "_locale.findElementTooltip",
      ),
    ];
  }
}
