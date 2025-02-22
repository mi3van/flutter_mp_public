import 'dart:io' show Platform, exit;

import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/pages.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_popup.dart';
import 'package:my_precious/service_locator.dart';

class HelperUiNavigation {
// Private constructor
  HelperUiNavigation._();

  static Route? getRoute(RouteSettings settings) {
    final builder = Pages.routes[settings.name];

    if (builder != null) {
      Pages.contrs[settings.name]!()?.firstOnPageLoading(settings.arguments);

      final customRouteBuilder = Pages.transitions[settings.name];

      return customRouteBuilder != null
          ? customRouteBuilder(
              builder: builder,
              settings: settings,
            )
          : MaterialPageRoute(
              builder: builder,
              settings: settings,
            );
    } else {
      return null;
    }
  }

  static void showDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  static void popPage(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      _checkConfirmPressAndExit(
        uiLocator.localesController.locale,
      );
    }
  }

  static void popToPage(
    BuildContext context,
    String pageRoute,
  ) {
    Navigator.of(context).popUntil(ModalRoute.withName(pageRoute));
  }

  static void pushPage({
    required BuildContext context,
    required String pageRoute,
    Object? arguments,
  }) {
    // Check for already existing page
    if (ModalRoute.of(context)?.settings.name != pageRoute) {
      Navigator.of(context).restorablePushNamed(
        pageRoute,
        arguments: arguments,
      );
    }
  }

  static void replaceLastToPage({
    required BuildContext context,
    required String pageRoute,
    Object? arguments,
  }) {
    Navigator.of(context).restorablePushReplacementNamed(
      pageRoute,
      arguments: arguments,
    );
  }

  static void popAndReplaceLastToPage({
    required BuildContext context,
    required String pageRoute,
    Object? arguments,
  }) {
    Navigator.of(context).restorablePopAndPushNamed(
      pageRoute,
      arguments: arguments,
    );
  }

  static void replaceAllToPage({
    required BuildContext context,
    required String pageRoute,
    Object? arguments,
  }) {
    // TODO Need to test difference
    // return Navigator.of(context).pushReplacementNamed(
    Navigator.of(context).restorablePushNamedAndRemoveUntil(
      pageRoute,
      (Route route) => false,
      arguments: arguments,
    );
  }

  static void replaceToPageUntil({
    required BuildContext context,
    required String newPageRoute,
    required String untilPageRoute,
    Object? arguments,
  }) {
    Navigator.of(context).restorablePushNamedAndRemoveUntil(
      newPageRoute,
      ModalRoute.withName(untilPageRoute),
      arguments: arguments,
    );
  }

  static int _previousPopTimeMsForExit = 300;

  static void _checkConfirmPressAndExit(AppLocale locale) {
    if (kIsWeb) {
      return;
    }
    final nowTimeMs = DateTime.now().millisecondsSinceEpoch;
    final difference = nowTimeMs - _previousPopTimeMsForExit;
    if (difference > appExitCheckIntervalInMs) {
      cLocator.appAlertController.showSnackBar("locale.pressBackToLeave");
      _previousPopTimeMsForExit = nowTimeMs;
    } else {
      final isExitAvailable = !cLocator.authModel.isAuthLoadingNotifier.value &&
          !cLocator.userModel.isUserLoadingNotifier.value &&
          !cLocator.settingsModel.isSettingsLoadingNotifier.value;
      isExitAvailable ? _exitAction() : HelperPopup.showToastWaitLittle();
    }
  }

  static void forceExit() => _exitAction();

  static void _exitAction() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

  static void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
