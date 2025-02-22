import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/bottom_bar/base_bottom_bar.dart';

abstract class PreciousBaseBottomScrollBar extends PreciousBaseBottomBar {
  const PreciousBaseBottomScrollBar({super.key});

  List<Widget> getBtnWidgets();

  @override
  Widget mainWidget() => _MainBottomWidget(getBtnWidgets);
}

// const _barButtonsRightMargin =
//     fabBarMargin + fabBarMargin + PreciousFAB.defaultSize + paddingRegular;

class _MainBottomWidget extends StatelessWidget {
  const _MainBottomWidget(this.getBarWidgets);

  final List<Widget> Function() getBarWidgets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        paddingSmaller,
        paddingSmaller,
        paddingSmaller,
        paddingSmaller,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: getBarWidgets(),
      ),
    );
  }
}
