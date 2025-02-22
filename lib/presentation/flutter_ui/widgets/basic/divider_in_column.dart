import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';

class DividerInColumn extends StatelessWidget {
  static const _defaultHeight = 1.0;

  final Color? color;
  final double verticalPadding;
  final double localBottomPadding;

  const DividerInColumn({
    super.key,
    this.color = Colors.grey,
    this.verticalPadding = paddingRegular,
    double? bottomPadding,
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
      child: Divider(
        color: color,
        height: _defaultHeight,
      ),
    );
  }
}
