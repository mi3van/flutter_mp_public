import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/bottom_bar/base_bottom_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/app_bar.dart';

class PreciousScrollView extends StatelessWidget {
  const PreciousScrollView({
    super.key,
    required this.slivers,
    this.scrollController,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  });

  final ScrollController? scrollController;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  final List<Widget> slivers;

  // Padding for showing correctly items behind the BottomAppBar (expanded body)
  static const _bottomPadding =
      PreciousBaseBottomBar.widgetHeight + paddingSmaller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      keyboardDismissBehavior: keyboardDismissBehavior,
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        ...slivers,
        // Padding that behind the BottomAppBar
        if (isBodyExtend)
          const SliverPadding(padding: EdgeInsets.only(top: _bottomPadding)),
      ],
    );
  }

  static const double _defaultScrollHeight =
      PreciousSliverAppBar.defaultExpandedHeight -
          PreciousSliverAppBar.defaultWidgetHeight;

// Solution to minimize extended by default SliverAppBar
  static ScrollController getScrollController() =>
      ScrollController(initialScrollOffset: _defaultScrollHeight);
}
