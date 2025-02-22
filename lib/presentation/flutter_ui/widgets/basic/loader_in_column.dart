import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';

class LoaderInColumn extends StatelessWidget {
  static const _defaultHeight = 1.0;

  final Color? color;
  final double verticalPadding;
  final double localBottomPadding;
  final double height;

  const LoaderInColumn({
    super.key,
    this.color = Colors.amber,
    this.verticalPadding = paddingRegular,
    double? bottomPadding,
    this.height = _defaultHeight,
  }) : localBottomPadding = bottomPadding ?? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        paddingRegular,
        verticalPadding,
        paddingRegular,
        localBottomPadding,
      ),
      child: LinearProgressIndicator(
        minHeight: height,
        color: color,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
