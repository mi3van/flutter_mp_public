import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

part '_overflow_image_top_right.dart';

class PreciousSliverAppBar extends _BasePreciousSliverAppBar {
  static const defaultWidgetHeight =
      appBarContentMaxHeight + paddingRegular + paddingRegular;
  static const defaultExpandedHeight = defaultWidgetHeight * 1.5;

  const PreciousSliverAppBar({
    super.key,
    required super.mainWidget,
    required super.isPinned,
    required super.isExpandable,
    required super.backgroundImageLink,
    required super.dividerWidget,
    super.widgetHeight,
    super.expandedHeight,
  }) : super(
          mainPadding: const EdgeInsets.fromLTRB(
              paddingRegular, paddingRegular, paddingRegular, 0),
          titleContainerPadding: const EdgeInsets.only(bottom: paddingRegular),
          syncWidgetPadding: EdgeInsets.zero,
          dividerWidgetPadding: EdgeInsets.zero,
        );
}

class RootSliverAppBar extends _BasePreciousSliverAppBar {
  static const defaultWidgetHeight =
      appBarContentMaxHeight + paddingRegular + paddingRegular + paddingMicro;
  const RootSliverAppBar({
    super.key,
    required super.mainWidget,
    required super.isPinned,
    required super.isExpandable,
    required super.backgroundImageLink,
    required super.dividerWidget,
    super.expandedHeight,
  }) : super(
          widgetHeight: defaultWidgetHeight,
          mainPadding: EdgeInsets.zero,
          titleContainerPadding: EdgeInsets.zero,
          syncWidgetPadding: const EdgeInsets.all(itemSyncWidgetPadding),
          dividerWidgetPadding:
              const EdgeInsets.symmetric(horizontal: paddingRegular),
        );
}

class _BasePreciousSliverAppBar extends StatelessWidget {
  final Widget mainWidget;
  final bool isPinned;
  final bool isExpandable;
  final Widget dividerWidget;
  final String backgroundImageLink;
  final EdgeInsets mainPadding;
  final EdgeInsets titleContainerPadding;
  final EdgeInsets syncWidgetPadding;
  final EdgeInsets dividerWidgetPadding;
  final double widgetHeight;
  final double expandedHeight;

  const _BasePreciousSliverAppBar({
    super.key,
    required this.mainWidget,
    required this.isPinned,
    required this.isExpandable,
    required this.backgroundImageLink,
    required this.dividerWidget,
    required this.mainPadding,
    required this.titleContainerPadding,
    required this.syncWidgetPadding,
    required this.dividerWidgetPadding,
    this.widgetHeight = PreciousSliverAppBar.defaultWidgetHeight,
    this.expandedHeight = PreciousSliverAppBar.defaultExpandedHeight,
  });

  @override
  Widget build(BuildContext context) {
    final surfaceColor =
        uiLocator.appController.theme(context).colorScheme.surface;

    return SliverAppBar(
      stretch: true,
      pinned: isPinned,
      surfaceTintColor: surfaceColor,
      shadowColor: surfaceColor,
      backgroundColor: surfaceColor,
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      toolbarHeight: widgetHeight,
      collapsedHeight: widgetHeight,
      expandedHeight: isExpandable ? expandedHeight : widgetHeight,
      flexibleSpace: FlexibleSpaceBar(
          title: Stack(alignment: Alignment.bottomCenter, children: [
            Padding(
              padding: titleContainerPadding,
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  mainWidget,
                ],
              ),
            ),
            Padding(
              padding: dividerWidgetPadding,
              child: dividerWidget,
            ),
          ]),
          titlePadding: mainPadding,
          expandedTitleScale: 1,
          collapseMode: CollapseMode.pin,
          background: _OverflowImageTopRight(
            imageLink: backgroundImageLink,
          )),
    );
  }
}
