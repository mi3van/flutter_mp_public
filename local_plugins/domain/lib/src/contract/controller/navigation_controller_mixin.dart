mixin NavigationControllerMixin<C> implements _ItemsNavigationMixin<C> {
  void showWelcome(C context);

  void showDrawerClicked(C context);

  void appAboutClicked(C context);

  void searchClicked(C context);

  void settingsClicked(C context);

  void userClicked(C context);

  void fromDrawerAppNameClicked(C context);
  void fromDrawerUserClicked(C context);

  void fromDrawerSettingsClicked(C context);

  void fromSettingsSortModeClicked(C context);

  void openPageRoute(C context, String route, {Object? args});

  void onBackPressed(C context);

  void forceExit();
}

mixin _ItemsNavigationMixin<C> {
  void onRootPop(C context);
  void onCloseUntilRoot(C context);
}
