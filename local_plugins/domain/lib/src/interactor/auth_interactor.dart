import 'dart:async';
import 'package:domain/domain.dart';

class AuthInteractor with AuthInteractorMixin {
  late final AuthRepositoryMixin _authRepo = iLocator.authRepository;
  late final SecureStorageRepositoryMixin _secureStorageRepo =
      iLocator.secureStorageRepository;

  StreamSubscription? _credsUpdateSubscription;

  String? _signedEmail;
  String? _signedName;
  String? _signedPermissionId;

  @override
  bool isAuth = false;

  @override
  Future<bool> tryRestoreAuthFirstInit() async {
    try {
      isAuth = await _tryRestoreAuthAction();
      if (isAuth) await _initsSuccessAuth(() {});
      return isAuth;
    } on UnauthorizedCredsException catch (_) {
      _showToast(SnackbarCodeType.restoreAuthFailed);
      // First init silent check.
    } on Exception catch (_) {}
    return isAuth = false;
  }

  @override
  Future<bool> tryRestoreAuth() async {
    try {
      await iLocator.appInteractor.internetFetch();

      isAuth = await _tryRestoreAuthAction();
      if (isAuth) await _initsSuccessAuth(_repeatingAuthClean);
      return isAuth;
    } on NoInternetException catch (_) {
      _showToast(SnackbarCodeType.internetRequired);
    } on UnauthorizedCredsException catch (_) {
      _showToast(SnackbarCodeType.restoreAuthFailed);
      signOut();
    } on BaseException catch (e) {
      iLocator.appAlertController.showExceptionAlert(e);
    } on Exception catch (e) {
      iLocator.appAlertController.showExceptionMessageAlert(e.toString());
    }
    return isAuth = false;
  }

  @override
  Future<bool> signIn() async {
    try {
      await iLocator.appInteractor.internetFetch();

      final credentials = await _authRepo.signIn();
      await _encodeAndSaveCredentials(credentials);
      isAuth = await _authRepo.isSignedIn();

      if (isAuth) {
        await _initsSuccessAuth(_repeatingAuthClean);
      } else {
        _showToast(SnackbarCodeType.signInFailed);
      }
      return isAuth;
    } on NoInternetException catch (_) {
      _showToast(SnackbarCodeType.internetRequired);
    } on UnauthorizedCredsException catch (_) {
      revokeAuth();
      _showToast(SnackbarCodeType.signInFailed);
    } on NotAuthUserException catch (_) {
      // do nothing
    } on BaseException catch (e) {
      iLocator.appAlertController.showExceptionAlert(e);
    } on Exception catch (e) {
      iLocator.appAlertController.showExceptionMessageAlert(e.toString());
    }
    return isAuth = false;
  }

  @override
  Future<bool> requestSharingScopes() async {
    await iLocator.appInteractor.internetFetch();
    final credentials = await _authRepo.requestSharingScopes();
    final isSuccess = credentials.isNotEmpty;
    if (isSuccess) await _encodeAndSaveCredentials(credentials);
    return isSuccess;
  }

  @override
  Future<void> signOut() async {
    await _clearAuthAction();
    await iLocator.userController.setOriginalUserSelected();
    await _authRepo.signOut();
  }

  @override
  Future<void> revokeAuth() async {
    await _clearAuthAction();
    await iLocator.userController.setOriginalUserSelected();
    await _authRepo.revokeAuth();
    await _authRepo.cleanUserCache();
  }

  @override
  String? get signedEmail => _signedEmail;
  @override
  String? get signedName => _signedName;

  @override
  Future<bool> isCredentialsExistForUi() async {
    return (await _dbCredentialsJson) != null;
  }

  @override
  String get signedPermissionIdThrow {
    if (_signedPermissionId != null) {
      return _signedPermissionId!;
    } else {
      throw NotAuthUserException();
    }
  }

  @override
  void isScopesToMeSharingAvailableThrow() {
    if (!_authRepo.isToMeSharingAvailable) {
      throw SharingNotAvailableException();
    }
  }

  Future<bool> _tryRestoreAuthAction() async {
    final dbCredentialsJson = await _dbCredentialsJson;

    return dbCredentialsJson != null
        ? await _authRepo.tryRestoreAuthByTokens(dbCredentialsJson) == true
        : false;
  }

  Future<void> _initsSuccessAuth(void Function() additionalInit) async {
    _credsUpdateSubscription ??= _authRepo.credsUpdateStream?.listen(
      (updatedCreds) => _encodeAndSaveCredentials(updatedCreds),
    );
    await _initSignedInformation();
    additionalInit();
  }

  void _repeatingAuthClean() {
    iLocator.searchItemController.cleanValues();
  }

  Future<Map<String, dynamic>?> get _dbCredentialsJson async {
    final userEncodedCreds =
        await _secureStorageRepo.readData(SecureData.originalUserCreds);

    return userEncodedCreds != null
        ? TypeConverter.mapFromJson(userEncodedCreds)
        : null;
  }

  Future<void> _encodeAndSaveCredentials(Map<String, dynamic> credentialsJson) {
    return _secureStorageRepo.updateData(
      SecureData.originalUserCreds,
      TypeConverter.mapToJson(credentialsJson),
    );
  }

  Future<void> _clearAuthAction() async {
    isAuth = false;
    _signedPermissionId = null;
    _signedEmail = null;
    _signedName = null;

    if (_credsUpdateSubscription != null) {
      _credsUpdateSubscription?.cancel();
      _credsUpdateSubscription = null;
    }

    await _cleanSecureData();
    iLocator.authController.cleanValues();
  }

  Future<void> _cleanSecureData() async {
    final dbVersion = await _secureStorageRepo.readData(
      SecureData.dbVersion,
    );
    final cloudSharedLastCheck = await _secureStorageRepo.readData(
      SecureData.sharedToUsersCountLastCheck,
    );
    final donationLastDate = await _secureStorageRepo.readData(
      SecureData.donationLastDate,
    );

    await _secureStorageRepo.deleteAllData();

    // Restore original user uuid
    await _secureStorageRepo.updateData(
      SecureData.originalUserUuid,
      iLocator.userInteractor.originalUserUuid,
    );
    await _secureStorageRepo.updateData(
      SecureData.dbVersion,
      dbVersion,
    );
    await _secureStorageRepo.updateData(
      SecureData.sharedToUsersCountLastCheck,
      cloudSharedLastCheck,
    );
    await _secureStorageRepo.updateData(
      SecureData.donationLastDate,
      donationLastDate,
    );
  }

  Future<void> _initSignedInformation() async {
    _signedPermissionId = await _secureStorageRepo.readData(
      SecureData.originalUserPermissionId,
    );
    if (_signedPermissionId == null) {
      _signedPermissionId = null;
      _signedEmail = null;
      _signedName = null;

      _signedEmail ??= _authRepo.signedEmail;
      _signedName ??= _authRepo.signedName;

      await _updateSignedInStorage();
    } else {
      _signedEmail = await _secureStorageRepo.readData(SecureData.signedEmail);
      _signedName = await _secureStorageRepo.readData(SecureData.signedName);
    }
  }

  Future<void> _updateSignedInStorage() async {
    if (_signedPermissionId != null) {
      await _secureStorageRepo.updateData(
        SecureData.originalUserPermissionId,
        _signedPermissionId!,
      );
    }
    if (_signedEmail != null) {
      await _secureStorageRepo.updateData(
        SecureData.signedEmail,
        _signedEmail!,
      );
    }
    if (_signedName != null) {
      await _secureStorageRepo.updateData(
        SecureData.signedName,
        _signedName!,
      );
    }
  }

  void _showToast(SnackbarCodeType snackCode) {
    iLocator.appAlertController.showSnackBarCode(snackCode);
  }
}
