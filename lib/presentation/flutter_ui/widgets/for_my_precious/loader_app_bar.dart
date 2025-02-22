import 'package:flutter/material.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/presentation/flutter_ui/widgets//basic/loader_in_column.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/prec_divider_in_column.dart';

class PreciousLoaderAppBar extends StatelessWidget {
  const PreciousLoaderAppBar({
    super.key,
    required this.isLoading,
  });

  static const verticalPadding = 0.0;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const PreciousDividerInColumn(
          verticalPadding: verticalPadding,
        ),
        if (isLoading)
          LoaderInColumn(
            verticalPadding: verticalPadding,
            color: ThemePalette.primaryMiddleColor,
          ),
      ],
    );
  }
}
