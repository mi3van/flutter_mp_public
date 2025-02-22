import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final Widget headerChild;
  final AlignmentGeometry align;
  final double height;
  final double horizontalPadding;

  const HeaderWidget({
    super.key,
    required this.headerChild,
    required this.align,
    this.height = double.infinity,
    this.horizontalPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: horizontalPadding == 0
          ? null
          : EdgeInsets.symmetric(horizontal: horizontalPadding),
      alignment: align,
      child: headerChild,
    );
  }
}
