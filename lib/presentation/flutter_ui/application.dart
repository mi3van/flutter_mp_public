import 'package:domain/domain.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/pages.dart';
import 'package:my_precious/presentation/common/contract/export_model_controller.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/controller/navigation_controller.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_ui_navigation.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_app.dart';
import 'package:my_precious/presentation/flutter_ui/widgets//basic/unknown_route_widget.dart';
import 'package:my_precious/service_locator.dart';
import 'package:store_package/factory.dart';

class Application extends StatefulWidget with GetItStatefulWidgetMixin {
  Application({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application>
    with GetItStateMixin, RestorationMixin, WidgetsBindingObserver {
  @override
  String? get restorationId => appStateRestorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) =>
      uiLocator.restorationUiController.restoreState(registerForRestoration);

  @override
  void initState() {
    super.initState();
    if (uiLocator.platformUiController.isNeedLifecycleUsing) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    uiLocator.appController.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final savedCode = watchX<SettingsModelControllerMixin, String>(
      (model) => (model).selectedLocaleNotifier,
    );
    final themeType = watchX<SettingsModelControllerMixin, ThemeType>(
      (model) => (model).themeNotifier,
    );
    StoreDependFactory.checkAppUpdate(context).onError((e, s) =>
        uiLocator.appAlertController.showExceptionMessageAlert(e.toString()));

    return MaterialApp(
      restorationScopeId: appName,
      title: appName,

      // Theming
      theme: Theming.light,
      darkTheme: Theming.dark,
      themeMode: Theming.adaptToPlatformTheme(themeType),

      // Routing
      initialRoute: Pages.defaultRoute,
      onGenerateRoute: (settings) => HelperUiNavigation.getRoute(settings),
      onUnknownRoute: (settings) =>
          UnknownRouteWidget.getUnknownRouteBuilder(settings),
      navigatorKey: NavigationController.keyApplication,

      // Localization
      locale: uiLocator.localesController.codeToPlatformLocale(savedCode),
      localizationsDelegates: AppLocale.localizationsDelegates,
      supportedLocales: uiLocator.supportLocales,
      builder: (context, child) {
        uiLocator.localesController.setupLocales(context);
        uiLocator.appController.setupThemes(context);

        return child ?? const SizedBox.shrink();
      },
      scrollBehavior: _PreciousScrollBehavior(),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.paused) {
        uiLocator.appController.onPause();
      } else if (state == AppLifecycleState.resumed) {
        uiLocator.appController.onResume();
      }
    });
  }
}

// Needs for correct touch-scroll in windows
class _PreciousScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.trackpad,
      };
}
