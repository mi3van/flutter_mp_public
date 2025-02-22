import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/search_item_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_popup.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/headers/header_widget_buttons.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/no_some_yet_widget.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/avatar_data_with_title_on_surface.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/app_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/scroll_view.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/loader_app_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/prec_divider_in_column.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/text_field/search_item_text_field.dart';
import 'package:my_precious/service_locator.dart';

class SearchItemPage extends StatelessWidget {
  const SearchItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreciousScrollView(
        scrollController: PreciousScrollView.getScrollController(),
        slivers: [
          PreciousSliverAppBar(
            isPinned: true,
            isExpandable: true,
            backgroundImageLink: uiLocator.appModel.holidayMode.mainImgLnk,
            mainWidget: HeaderWidgetWithButtons(
              horizontalPadding: paddingSmaller,
              headerChild: const SearchItemTextField(),
              height: headerInSliverHeight,
              leadingWidget: PreciousTooltip(
                message:
                    uiLocator.localesController.localeM.previousPageTooltip,
                child: const Icon(Icons.arrow_back_rounded),
              ),
              leadingOnPressed: () =>
                  uiLocator.navigationController.onBackPressed(context),
              secondaryWidget: PreciousTooltip(
                message: uiLocator.localesController.localeM.clearButtonTooltip,
                child: const Icon(Icons.cleaning_services_rounded),
              ),
              secondaryOnPressed: (context) =>
                  uiLocator.searchItemController.cleanSearchText(),
            ),
            dividerWidget: _HeaderDividerProgressBar(),
          ),
          _FoundItemSliverWrapper(),
        ],
      ),
    );
  }
}

class _HeaderDividerProgressBar extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final isSearchingItems = watchX(
        (SearchItemModelControllerMixin model) => model.isSearchingNotifier);

    return PreciousLoaderAppBar(isLoading: isSearchingItems);
  }
}

bool get _isSharedToMeIsEmpty => true;

const _listDefaultPadding = EdgeInsets.fromLTRB(
  paddingSmall,
  paddingSmall,
  paddingSmall,
  0,
);

class _FoundItemSliverWrapper extends StatelessWidget with GetItMixin {
  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    final foundItemList = watchX(
      (SearchItemModelControllerMixin model) => model.foundUserItemsNotifier,
    );

    final selectedUser = uiLocator.userModel.selectedUserNotifier.value;

    if (selectedUser != null) {
      final EdgeInsetsGeometry listPadding;
      final List<Widget> widgets;
      if (foundItemList == null || foundItemList.isEmpty) {
        listPadding = _listDefaultPadding;
        widgets = [NoSomeYetWidget(title: "_locale.tryToWriteSomething")];
      } else if (_isSharedToMeIsEmpty) {
        listPadding = _listDefaultPadding;
        // Build for owner slideable.
        widgets = _buildSelectedUserItemsList(
          context,
          selectedUser.dbUserUuid,
          foundItemList.values.first.$2,
        );
      } else {
        listPadding = const EdgeInsets.symmetric(
          horizontal: paddingSmall,
        );
        widgets = [
          ..._buildUserAvatarItemsList(
            context,
            foundItemList.values.first.$1,
            foundItemList.values.first.$2,
            _buildSelectedUserItemsList,
            _getAvatarDataWithTitleOnSurfaceWithPadding,
          ),
          ...foundItemList.values.skip(1).expand((entity) {
            return _buildUserAvatarItemsList(
              context,
              entity.$1,
              entity.$2,
              _buildOtherUserItemsList,
              _getAvatarDataWithTitleOnSurfaceWithDivider,
            );
          }),
        ];
      }

      return SliverPadding(
        padding: listPadding,
        sliver: SliverList(
          delegate: SliverChildListDelegate(widgets),
        ),
      );
    } else {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
  }

  List<Widget> _buildUserAvatarItemsList(
      BuildContext context,
      User user,
      List<Object> items,
      List<Widget> Function(
        BuildContext context,
        String userUuid,
        List<Object> items,
      ) buildUserItemsList,
      Widget Function({
        required Key keyForAvatar,
        required Uint8List? avatarData,
        required String title,
        String? subtitle,
      }) getUserAvatar) {
    final String title = user.email != uiLocator.userModel.originalUserEmail
        ? user.nickname ?? ""
        : "_locale.mySpace";

    return [
      getUserAvatar(
        keyForAvatar: Key("AvatarDataWithTitleOnSurface_${user.hashCode}"),
        avatarData: user.avatarPreview,
        title: title,
        subtitle: user.email,
      ),
      ...buildUserItemsList(
        context,
        user.dbUserUuid,
        items,
      ),
    ];
  }

  List<Widget> _buildSelectedUserItemsList(
    BuildContext context,
    String userUuid,
    List<Object> items,
  ) {
    return _buildItemsList(
      context,
      userUuid,
      items,
      (item, onTap) =>
          Text(item.toString(), key: Key("Search_HorizItemCard_$item")),
    );
  }

  List<Widget> _buildOtherUserItemsList(
    BuildContext context,
    String userUuid,
    List<Object> items,
  ) {
    return _buildItemsList(
      context,
      userUuid,
      items,
      (item, onTap) =>
          Text(item.toString(), key: Key("Search_HorizItemStaticCard_$item")),
    );
  }

  List<Widget> _buildItemsList(
    BuildContext context,
    String userUuid,
    List<Object> items,
    Widget Function(Object item, Function() onTap) buildHorizontalItemCard,
  ) {
    return items.isNotEmpty
        ? items
            .map((item) => buildHorizontalItemCard(item, () {
                  if (uiLocator.searchItemModel.isSearchingNotifier.value) {
                    HelperPopup.showToastWaitLittle();
                  } else {
                    uiLocator.navigationController.onCloseUntilRoot(context);
                  }
                }))
            .toList()
        : [
            NoSomeYetWidget(title: "_locale.itemsNotFound"),
          ];
  }
}

Widget _getAvatarDataWithTitleOnSurfaceWithPadding({
  required Key keyForAvatar,
  required Uint8List? avatarData,
  required String title,
  String? subtitle,
}) {
  return _basicGetAvatarWidget(
    keyForAvatar: keyForAvatar,
    avatarData: avatarData,
    title: title,
    subtitle: subtitle,
    getTopSpaceWidget: () => const SizedBox.shrink(),
  );
}

Widget _getAvatarDataWithTitleOnSurfaceWithDivider({
  required Key keyForAvatar,
  required Uint8List? avatarData,
  required String title,
  String? subtitle,
}) {
  return _basicGetAvatarWidget(
    keyForAvatar: keyForAvatar,
    avatarData: avatarData,
    title: title,
    subtitle: subtitle,
    getTopSpaceWidget: () => const PreciousDividerInColumn(
      verticalPadding: 0.0,
    ),
  );
}

Widget _basicGetAvatarWidget({
  required Key keyForAvatar,
  required Uint8List? avatarData,
  required String title,
  required Widget Function() getTopSpaceWidget,
  String? subtitle,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      getTopSpaceWidget(),
      AvatarDataWithTitleOnSurface(
        key: keyForAvatar,
        avatarData: avatarData,
        title: title,
        subtitle: subtitle,
      ),
    ],
  );
}
