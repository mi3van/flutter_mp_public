import 'package:domain/domain.dart';

mixin AuthControllerMixin implements InitDisposeMixin {
  Future<bool> tryRestoreAuthByTokensClick();

  Future<void> signInToCloudAndTrySync();

  Future<void> exitCloud();
}
