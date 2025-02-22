import 'package:domain/domain.dart';

mixin AppControllerMixin<C, T, P>
    implements
        _AppControllerLoaderMixin,
        _AppControllerSettingsMixin,
        DisposeMixin,
        LifecycleMixin {
  Future<void> get necessaryInit;
// Additional palette.
  T theme(C context);
  P get palette;
  void setupThemes(C context);

  Future<void> onInit();

  Future<void> onAppInitRetry();

  Future<void> onSuccessAppInit(C context);

  Future<void> onWelcomeWatchedClick(C context);
}

mixin _AppControllerLoaderMixin {
  void showAppLoader();

  void hideAppLoader();
}

mixin _AppControllerSettingsMixin {
  Future<void> onSupportClick();
  Future<void> onSuggestImprovementClick();
  Future<void> onSuggestTransltionClick();
  Future<void> onSupportLongClick();

  Future<void> onShareLinkClick();
  Future<void> onShareLinkLongClick();

  Future<void> onRateAppClick();

  Future<void> onPrivacyPolicyClick();

  Future<void> onAppVersionClick();
}
