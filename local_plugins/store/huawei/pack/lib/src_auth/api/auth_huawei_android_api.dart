import 'dart:async';

import 'package:data/data.dart' show BaseAuthApi, Client;
import 'package:domain/domain.dart';
import 'package:flutter/services.dart';
import 'package:huawei_account/huawei_account.dart';

class HuaweiAndroidAuthApi extends BaseAuthApi<Client> {
  static const _networkErrorCode = 'network_error';

  late final AccountAuthService _authService;
  AuthAccount? _authAccount;

  @override
  void onFirstInit() {
    final AccountAuthParamsHelper authParamsHelper = AccountAuthParamsHelper()
      ..setProfile()
      ..setAccessToken();
    final AccountAuthParams authParams = authParamsHelper.createParams();
    _authService = AccountAuthManager.getService(authParams);
  }

  @override
  Future<Map<String, dynamic>> signIn() async {
    try {
      _authAccount = await _authService.signIn();
      if (_authAccount == null) throw NotAuthUserException();
      return _authAccount!.toMap();
    } on PlatformException catch (platformException) {
      if (platformException.code == _networkErrorCode) {
        throw NoInternetException();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> requestSharingScopes() async {
    throw UnimplementedError();
  }

  @override
  Future<bool> get isSignedIn async => _authAccount?.account != null;

  @override
  String? get signedEmail => _authAccount?.email;
  @override
  String? get signedName => _authAccount?.email;

  @override
  Stream<Map<String, dynamic>>? get credsUpdateStream => null;

  @override
  Future<bool?> tryRestoreAuthByTokens(credentialsJson) async {
    if (credentialsJson == null) {
      return null;
    }
    try {
      _authAccount = await _authService.silentSignIn();

      return _authAccount?.account != null;
    } on PlatformException catch (platformException) {
      if (platformException.code == _networkErrorCode) {
        throw NoInternetException();
      } else {
        rethrow;
      }
    }
  }

  @override
  bool get isToMeSharingAvailable => false;

  @override
  Future<void> signOut() async {
    await super.closeBaseClient();
    try {
      await _authService.signOut();
      _authAccount = null;
    } catch (_) {}
  }

  @override
  Future<void> revokeAuth() async {
    await super.closeBaseClient();
    try {
      await _authService.cancelAuthorization();
      _authAccount = null;
    } catch (_) {}
  }

  @override
  Future<void> cleanUserCache() async {}
}
