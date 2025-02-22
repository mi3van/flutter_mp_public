import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/pages.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_ui_navigation.dart';
import 'package:my_precious/service_locator.dart';

class NavigationController implements NavigationControllerMixin<BuildContext> {
  static final GlobalKey<NavigatorState> keyApplication = GlobalKey();

  static GlobalKey<ScaffoldState>? rootPageKey;
  static void setUpNewKeyForRootPage() => rootPageKey = GlobalKey();

  @override
  void showWelcome(BuildContext context) {
    HelperUiNavigation.replaceAllToPage(
      context: context,
      pageRoute: Pages.welcome.route,
    );
  }

  @override
  void showDrawerClicked(BuildContext context) {
    HelperUiNavigation.showDrawer(context);
  }

  @override
  void searchClicked(BuildContext context) {
    _openPageRoute(context, Pages.search);
  }

  @override
  void appAboutClicked(BuildContext context) {
    _openPageRoute(context, Pages.appAbout);
  }

  @override
  void settingsClicked(BuildContext context) {
    _openPageRoute(context, Pages.settings);
  }

  @override
  void userClicked(BuildContext context) {
    _openPageRoute(context, Pages.userRoot);
  }

  @override
  void fromDrawerAppNameClicked(BuildContext context) {
    _onDrawerBackPressed();
    _openPageRoute(context, Pages.appAbout);
  }

  @override
  void fromDrawerUserClicked(BuildContext context) {
    _onDrawerBackPressed();
    userClicked(context);
  }

  @override
  void fromDrawerSettingsClicked(BuildContext context) {
    _onDrawerBackPressed();
    settingsClicked(context);
  }

  @override
  void fromSettingsSortModeClicked(context) {
    // Go to root page from settings.
    onBackPressed(context);
    cLocator.appAlertController.onShowSortModeAlert();
  }

  @override
  void onRootPop(BuildContext context) {
    if (rootPageKey?.currentState?.isDrawerOpen == true) {
      _onDrawerBackPressed();
    } else {
      // if (!cLocator.itemModel.depthM.isRootLevel) {
      //   cLocator.itemController.disposeLastItemOnce();
      // } else {
      onBackPressed(context);
    }
  }

  @override
  void onCloseUntilRoot(BuildContext context) {
    HelperUiNavigation.popToPage(context, Pages.userRoot.route);
  }

  @override
  void openPageRoute(BuildContext context, String route, {Object? args}) {
    HelperUiNavigation.pushPage(
      context: context,
      pageRoute: route,
      arguments: args,
    );
  }

  @override
  void onBackPressed(BuildContext context) {
    HelperUiNavigation.popPage(context);
  }

  @override
  void forceExit() => HelperUiNavigation.forceExit();

  void _onDrawerBackPressed() => rootPageKey?.currentState?.closeDrawer();

  void _openPageRoute(BuildContext context, Pages page, {Object? args}) {
    openPageRoute(context, page.route, args: args);
  }
}
