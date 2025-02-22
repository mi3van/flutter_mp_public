import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/service_locator.dart';

class AuthController implements AuthModelControllerMixin {
  AuthInteractorMixin get _interactor => cLocator.authInteractor;

  @override
  final ValueNotifier<bool> isAuthLoadingNotifier = ValueNotifier(false);
  @override
  final ValueNotifier<bool> isUserSignedInNotifier = ValueNotifier(false);
  @override
  final ValueNotifier<bool> isCredentialsExistNotifier = ValueNotifier(false);

  @override
  Future<void> onInit() async {
    final isAuthSuccess = await _interactor.tryRestoreAuthFirstInit();
    await _setUpSigningFlags(isAuthSuccess);
  }

  @override
  void cleanValues() {
    isUserSignedInNotifier.value = false;
    isCredentialsExistNotifier.value = false;
  }

  @override
  void onDispose() {
    isAuthLoadingNotifier.dispose();
    isUserSignedInNotifier.dispose();
    isCredentialsExistNotifier.dispose();
  }

  @override
  Future<void> signInToCloudAndTrySync() async {
    final isAuthSuccess = await _interactor.signIn();
    await _setUpSigningFlags(isAuthSuccess);
  }

  @override
  Future<bool> tryRestoreAuthByTokensClick() async {
    isAuthLoadingNotifier.value = true;

    final isAuthSuccess = await _interactor.tryRestoreAuth();
    await _setUpSigningFlags(isAuthSuccess);

    isAuthLoadingNotifier.value = false;
    return isAuthSuccess;
  }

  @override
  Future<void> exitCloud() async {
    isAuthLoadingNotifier.value = true;

    await _interactor.signOut();
    cLocator.appAlertController.showSnackBar(
      "cLocator.localesController.locale.appForgotYourCloud",
    );

    isAuthLoadingNotifier.value = false;
  }

  Future<void> _setUpSigningFlags(bool isSuccessfull) async {
    isUserSignedInNotifier.value = isSuccessfull;
    isCredentialsExistNotifier.value =
        await _interactor.isCredentialsExistForUi();
  }
}
