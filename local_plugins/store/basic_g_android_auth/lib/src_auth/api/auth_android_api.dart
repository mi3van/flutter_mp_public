// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:basic_google/src_auth/common/google_auth_config.dart';
import 'package:data/data.dart'
    show BaseAuthApi, BaseClient, BaseRequest, Client, StreamedResponse;
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' show DetailedApiRequestError;

// Previous value.
// const _credsMock = {"mock": "map"};
const _credsMock = {"cmock": "value"};

class GoogleAndroidAuthApi extends BaseAuthApi<_AuthenticateClient> {
  @override
  bool isToMeSharingAvailable = false;

  late GoogleSignIn _googleSignIn;

  @override
  void onFirstInit() {
    _googleSignIn = GoogleSignIn(
      scopes: _scopesForSharing,
      forceCodeForRefreshToken: true,
    );
  }

  @override
  Future<Map<String, dynamic>> signIn() async {
    try {
      final signInAccount = await _googleSignIn.signIn();
      if (signInAccount == null) {
        return throw NotAuthUserException();
      }
      await _setUpAuthClient(signInAccount);
      return _setUpSharingAvailable(_credsMock);
    } on PlatformException catch (platformException) {
      if (platformException.code == GoogleSignIn.kNetworkError) {
        throw NoInternetException();
      } else {
        rethrow;
      }
    } on DetailedApiRequestError catch (e) {
      if (e.status == HttpStatus.unauthorized) {
        throw UnauthorizedCredsException();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> requestSharingScopes() async {
    try {
      final isSuccess = await _googleSignIn.requestScopes(_scopesForSharing);
      return isSuccess ? _setUpSharingAvailable(_credsMock) : {};
    } on PlatformException catch (platformException) {
      if (platformException.code == GoogleSignIn.kNetworkError) {
        throw NoInternetException();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<bool> get isSignedIn => _googleSignIn.isSignedIn();

  @override
  String? get signedEmail => _googleSignIn.currentUser?.email;
  @override
  String? get signedName => _googleSignIn.currentUser?.displayName;

  @override
  Stream<Map<String, dynamic>>? get credsUpdateStream => null;

  @override
  Future<bool?> tryRestoreAuthByTokens(credentialsJson) async {
    if (credentialsJson == null) {
      return null;
    }
    try {
      final signInAccount = await _googleSignIn.signInSilently();

      if (signInAccount != null) {
        await _setUpAuthClient(signInAccount);
        _setUpSharingAvailable(credentialsJson);
      }

      return isSignedIn;
    } on SocketException catch (e) {
      if (e.osError?.errorCode == ExceptionCode.noInternetSocketAndroid) {
        throw NoInternetException();
      } else {
        rethrow;
      }
    } on PlatformException catch (platformException) {
      if (platformException.code == GoogleSignIn.kNetworkError) {
        throw NoInternetException();
      } else {
        rethrow;
      }
    } on DetailedApiRequestError catch (e) {
      if (e.status == HttpStatus.unauthorized) {
        throw UnauthorizedCredsException();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<void> cleanUserCache() async {
    await _googleSignIn.currentUser?.clearAuthCache();
  }

  @override
  Future<void> signOut() async {
    await super.closeBaseClient();
    try {
      await _googleSignIn.signOut();
    } catch (_) {}
  }

  @override
  Future<void> revokeAuth() async {
    await super.closeBaseClient();
    try {
      await _googleSignIn.disconnect();
    } catch (_) {}
  }

  Future<void> _setUpAuthClient(
    GoogleSignInAccount signInAccount,
  ) async {
    final headers = await signInAccount.authHeaders;
    authClient = _AuthenticateClient(headers, initAndGetInnerClient());
  }

  List<String> get _scopesForSharing => GoogleAuthConfig.cloudSyncScopes;

  Map<String, dynamic> _setUpSharingAvailable(Map<String, dynamic> creds) {
    // Map equals - new sign in with sharing scope.
    isToMeSharingAvailable = mapEquals(creds, _credsMock);
    return creds;
  }
}

class _AuthenticateClient extends BaseClient {
  final Map<String, String> headers;

  final Client innerClient;

  _AuthenticateClient(this.headers, this.innerClient);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return innerClient.send(request..headers.addAll(headers));
  }
}
