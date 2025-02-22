import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/pages/app_about_page.dart';
import 'package:my_precious/presentation/flutter_ui/pages/item/search_item_page.dart';
import 'package:my_precious/presentation/flutter_ui/pages/settings_page.dart';
import 'package:my_precious/presentation/flutter_ui/pages/splash_page.dart';
import 'package:my_precious/presentation/flutter_ui/pages/user_page.dart';
import 'package:my_precious/presentation/flutter_ui/pages/welcome_page.dart';
import 'package:my_precious/service_locator.dart';

enum Pages {
  search,
  userRoot,
  settings,
  appAbout,
  welcome,
  splash;

  String get route => name;
  // String get route => this != splash ? name : '/';

  static String get defaultRoute => Pages.splash.route;

  static final Map<String, WidgetBuilder> routes = {
    for (var page in Pages.values) page.route: _getWidgetBuilder(page),
  };

  static final Map<String, TransitionBuilder?> transitions = {
    for (var page in Pages.values)
      page.route: _getPageRouteBuilderFunction(page)
  };

  static final Map<String, ValueGetter<ControllerPageMixin?>> contrs = {
    for (var page in Pages.values)
      page.route: page == Pages.search
          ? () => uiLocator.searchItemController
          : () => null
  };
}

WidgetBuilder _getWidgetBuilder(Pages page) {
  switch (page) {
    case Pages.splash:
      return (context) => const SplashPage();
    case Pages.search:
      return (context) => const SearchItemPage();
    case Pages.userRoot:
      return (context) => const UserPage();
    case Pages.settings:
      return (context) => const SettingsPage();
    case Pages.appAbout:
      return (context) => const AppAboutPage();
    case Pages.welcome:
      return (context) => const WelcomePage();
  }
}

typedef TransitionBuilder = PageRouteBuilder Function({
  required WidgetBuilder builder,
  required RouteSettings? settings,
});

TransitionBuilder? _getPageRouteBuilderFunction(Pages page) {
  switch (page) {
    case Pages.splash:
    case Pages.welcome:
      return ({required builder, required settings}) => PageRouteBuilder(
            pageBuilder: (context, anim, secondaryAnim) => builder(context),
            settings: settings,
            transitionsBuilder: _getTransitionBuilder,
            transitionDuration: pageTransitionDuration,
            reverseTransitionDuration: pageTransitionDuration,
          );
    default:
      return null;
  }
}

Widget _getTransitionBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
