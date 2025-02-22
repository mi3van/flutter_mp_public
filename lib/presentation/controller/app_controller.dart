import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/boot_status.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/pages.dart';
import 'package:my_precious/presentation/common/contract/model_controller/app_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/service_locator/palette_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/controller/holiday_ui_modes.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_ui_navigation.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/service_locator.dart';

class AppController implements AppModelControllerMixin {
  @override
  Future<void> get necessaryInit => _inter.necessaryInit;

  @override
  final bootStatus = ValueNotifier<BootStatus?>(null);
  @override
  ValueNotifier<Pages?> pageAsyncListenerNotifier = ValueNotifier(null);

  @override
  late HolidayUiModeMixin holidayMode;

  AppInteractorMixin get _inter => cLocator.appInteractor;

  @override
  // Caching theme is not yet available (shadow on backgrounds appears).
  AppTheme theme(AppCntxt context) => Theme.of(context);

  @override
  PaletteMixin get palette => _palette!;
  PaletteMixin? _palette;

  @override
  void setupThemes(AppCntxt context) {
    final cntxTheme = theme(context);
    if (_palette == null) {
      _setupThemes(cntxTheme);
    } else if (_palette?.brightness != cntxTheme.brightness) {
      _setupThemes(cntxTheme);
      HelperUiNavigation.rebuildAllChildren(context);
    }
  }

  void _setupThemes(ThemeData cntxTheme) {
    _palette = ThemePalette.of(cntxTheme);
  }

  @override
  Future<void> onInit() async {
    try {
      bootStatus.value = BootStatus.booting;

      await _inter.onInit();

      _initHolidayUi();
      _inter
          .onInitAddon()
          .catchError((e) => _runBaseExceptionDelayed(e),
              test: (e) => e is BaseException)
          .catchError((e) => _runExceptionDelayed(e),
              test: (e) => e is Exception);

      bootStatus.value = BootStatus.success;
    } on BaseException catch (e) {
      _runBaseExceptionDelayed(e);
      bootStatus.value = BootStatus.error;
    } on Exception catch (e) {
      _runExceptionDelayed(e);
      bootStatus.value = BootStatus.error;
    }
  }

  @override
  Future<void> onAppInitRetry() async {
    cleanValues();
    await onInit();
  }

  @override
  void cleanValues() {
    _inter.cleanValues();
    bootStatus.value = null;
  }

  @override
  void onDispose() {
    _inter.onDispose();
    bootStatus.value = null;
  }

  @override
  void onPause() => _inter.onPause();

  @override
  void onResume() => _inter.onResume();

  @override
  Future<void> onSuccessAppInit(BuildContext context) async {
    // TODO Add navigationController events to EventHandlers
    if (cLocator.settingsModel.isWelcomeWatched) {
      _successOpenApp(context);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        uiLocator.navigationController.showWelcome(context);
      });
    }
  }

  @override
  Future<void> onWelcomeWatchedClick(BuildContext context) async {
    cLocator.settingsController.updateWelcomeWathed(true);
    _successOpenApp(context);
  }

  void _successOpenApp(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      uiLocator.navigationController.userClicked(context);
    });
  }

  AppLocale get _locale => cLocator.localesController.locale;

  @override
  Future<void> onSupportClick() async {
    // TODO: Move shareOut logic to appInteractor.
    await cLocator.shareOutInteractor.writeToSupport(
      supportTitle: "_locale.supportEmail",
      appVersion: appVersionDisplay,
    );
  }

  @override
  Future<void> onSuggestImprovementClick() {
    // TODO: Move shareOut logic to appInteractor.
    return cLocator.shareOutInteractor.writeEmail(
      subject: "_locale.suggestImprovementTitle",
    );
  }

  @override
  Future<void> onSuggestTransltionClick() {
    const nl = HelperText.newLineCharacter;
    final body = "${cLocator.localesController.code}$nl$nl"
        "${"_locale.currentSentenceTitle"} $nl$nl"
        "${"_locale.suggestTranslationTitle"}: ";

    // TODO: Move shareOut logic to appInteractor.
    return cLocator.shareOutInteractor.writeEmail(
      subject: "_locale.suggestTranslationTitle",
      body: body,
    );
  }

  @override
  Future<void> onSupportLongClick() async {
    // TODO: Move shareOut logic to appInteractor.
    await cLocator.shareOutInteractor.shareToClipboard(info: appSupportEmail);
    cLocator.appAlertController.showSnackBarFast(
      "_locale.emailCopied",
    );
  }

  @override
  Future<void> onShareLinkClick() async => _inter.onShareLinkClick();

  @override
  Future<void> onShareLinkLongClick() async {
    await _inter.onShareLinkLongClick();
    cLocator.appAlertController.showSnackBarFast(
      "_locale.linkCopied",
    );
  }

  @override
  Future<void> onRateAppClick() => _inter.onRateAppClick();

  @override
  Future<void> onPrivacyPolicyClick() => _inter.onPolicyClick();

  // static int appVersionClickCount = 0;

  @override
  Future<void> onAppVersionClick() async {
    // appVersionClickCount++;
    // if (appVersionClickCount == 4) {
    //   cLocator.appAlertController
    //       .showSnackBarFast("4 more clicks for our little secret");
    // }
    // if (appVersionClickCount > 7) {
    //   cLocator.appAlertController.showSnackBar(
    //     "I'm the kid version (Beta) of the app, nothing to show here yet ;)",
    //   );
    // }
  }

  @override
  void showAppLoader() {
    _setShowAppLoader(true);
  }

  @override
  void hideAppLoader() {
    _setShowAppLoader(false);
  }

  void _setShowAppLoader(bool isShow) {
    // isShowAppLoader.value = isShow;
  }

  void _runBaseExceptionDelayed(dynamic e) {
    _runExceptionDelayedFun(() {
      cLocator.appAlertController.showExceptionAlert(e);
    });
  }

  void _runExceptionDelayed(dynamic e) {
    _runExceptionDelayedFun(() {
      cLocator.appAlertController.showExceptionMessageAlert(e.toString());
    });
  }

  void _runExceptionDelayedFun(Function() fun) {
    Future.delayed(animationDurationFast, fun);
  }

  void _initHolidayUi() {
    final currMonth = DateTime.now().month;
    holidayMode = (currMonth != 12 && currMonth != 1)
        ? RegularDayHolidayUiMode()
        : ChristmasHolidayUiMode();
  }
}

Future<T> initLoadingNotifier<T>(
  ValueNotifier<bool> isLoadingNotifier,
  Future<T> Function() calledFun,
) async {
  if (isLoadingNotifier.value == false) {
    isLoadingNotifier.value = true;
    T result;
    try {
      result = await calledFun();
    } finally {
      isLoadingNotifier.value = false;
    }
    return result;
  } else {
    return await calledFun();
  }
}

Future<T> initLoadingAddonNotifier<T>(
  ValueNotifier<bool> isLoadingNotifier,
  Future<T> Function() calledFun, {
  required FutureOr<void> Function() initAddonFun,
}) async {
  if (isLoadingNotifier.value == false) {
    initAddonFun();
    isLoadingNotifier.value = true;
    final result = await calledFun();
    isLoadingNotifier.value = false;
    return result;
  } else {
    return await calledFun();
  }
}

void showToast(SnackbarCodeType snackCode) {
  cLocator.appAlertController.showSnackBarCode(snackCode);
}
