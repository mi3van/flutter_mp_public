import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/divider_in_column.dart';
import 'package:my_precious/service_locator.dart';

class PreciousDividerInColumn extends StatelessWidget {
  final double verticalPadding;
  final double? bottomPadding;
  final Color? color;

  const PreciousDividerInColumn({
    super.key,
    this.verticalPadding = paddingRegular,
    this.bottomPadding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return DividerInColumn(
      key: key,
      color: color ?? uiLocator.appController.palette.onSurface12,
      verticalPadding: verticalPadding,
      bottomPadding: bottomPadding,
    );
  }
}
