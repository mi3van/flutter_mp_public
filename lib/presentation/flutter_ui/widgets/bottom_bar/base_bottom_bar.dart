import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/bottom_bar/fab_precious.dart';
import 'package:my_precious/service_locator.dart';

abstract class PreciousBaseBottomBar extends StatelessWidget {
  const PreciousBaseBottomBar({super.key});

// Min height is 56.0 (BottomAppBar requirement)
  static const widgetHeight = elementHeightBig;

  Widget mainWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: widgetHeight,
        child: BottomAppBar(
          padding: const EdgeInsets.all(0.0),
          notchMargin: fabBarMargin,
          elevation: elevationRegular,
          shape: PreciousFAB.navigationFabBarShape,
          color: uiLocator.appController.palette.surface[2],
          clipBehavior: Clip.hardEdge,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: mainWidget(),
          ),
        ),
      ),
    );
  }
}
