import 'package:domain/domain.dart';

mixin AppInteractorMixin implements InitDisposeMixin, LifecycleMixin {
  Future<void> get necessaryInit;

  Future<void> onInitAddon();

  Future<void> internetFetch();

  Future<String> getSysMainInfo({required String appVersion});

  Future<void> onShareLinkClick();
  Future<void> onShareLinkLongClick();

  Future<void> onRateAppClick();

  Future<void> onPolicyClick();
}
