import 'dart:io' show Platform;

import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

class AppInteractor with AppInteractorMixin {
  ShareOutInteractorMixin get _shareInter => iLocator.shareOutInteractor;

  @override
  late Future<void> necessaryInit;
  @override
  Future<void> onInit() async {
    necessaryInit = Future.forEach<InitsAsyncMixin>([
      ...iLocator.necessaryInitsInScope,
      iLocator.dbMigrateInteractor,
    ], (initializable) => initializable.onInit());

    return necessaryInit;
  }

  @override
  Future<void> onInitAddon() async {
    await Future.forEach<InitsAsyncMixin>(
      iLocator.additionalInitsInScope,
      (initializable) => initializable.onInit(),
    );
  }

  @override
  void cleanValues() {
    for (var cleanables in iLocator.disposablesInScope) {
      cleanables.cleanValues();
    }
  }

  @override
  void onDispose() {
    for (var disposable in iLocator.disposablesInScope) {
      disposable.onDispose();
    }
  }

  @override
  void onPause() {
    for (var lifecycleRunner in iLocator.lifecyclesInScope) {
      lifecycleRunner.onPause();
    }
  }

  @override
  void onResume() {
    for (var lifecycleRunner in iLocator.lifecyclesInScope) {
      lifecycleRunner.onResume();
    }
  }

  @override
  Future<String> getSysMainInfo({required appVersion}) async {
    final appDomain = iLocator.marketRepository.appDomainForUi;
    String appLang = await iLocator.settingsInteractor.getLocalizationCode();
    appLang = appLang == "--" ? "auto" : appLang;

    const nbsp = HelperText.noBreakSpaceCharacter;
    const nl = HelperText.newLineCharacter;
    String generateLine(String title, String descr, String dot) {
      return "-$nbsp$title:$nbsp$descr$dot$nl";
    }

    return "$nl$nl"
        "--------${nbsp}App${nbsp}info$nbsp--------$nl"
        "${generateLine("System", kIsWeb ? "Web" : Platform.operatingSystem, ",")}"
        "${kIsWeb ? "" : Platform.operatingSystemVersion};$nl"
        "${generateLine("Space", appDomain, ";")}"
        "${generateLine("Version", appVersion, ";")}"
        "${generateLine("Language", appLang, ".")}"
        "-------------------------------$nl";
  }

  @override
  Future<void> internetFetch() => iLocator.httpRepository.internetFetch();

  @override
  Future<void> onPolicyClick() => _shareInter.openLinkExternal(policyLink);

  @override
  Future<void> onRateAppClick() => _shareInter.openLinkExternal(_marketAppLink);

  @override
  Future<void> onShareLinkClick() => _shareInter.share(info: _marketAppLink);

  @override
  Future<void> onShareLinkLongClick() => _shareInter.shareToClipboard(
        info: _marketAppLink,
      );

  String get _marketAppLink => iLocator.marketRepository.appMarketLink;
}
