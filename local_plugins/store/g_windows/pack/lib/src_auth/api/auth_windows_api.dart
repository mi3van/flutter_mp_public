// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:basic_google/src_auth/common/google_auth_config.dart';
import 'package:data/data.dart' show BaseAuthApi;
import 'package:domain/domain.dart';
import 'package:googleapis_auth/auth_io.dart' as auth_lib;
import 'package:store_package/src_auth/common/firebase_options.dart';
import 'package:url_launcher/url_launcher.dart' as url_lib;

class GoogleWindowsAuthApi
    extends BaseAuthApi<auth_lib.AutoRefreshingAuthClient> {
  late auth_lib.ClientId _clientId;

  @override
  void onFirstInit() {
    const String clientIdString = String.fromEnvironment(
      WindowsSecretKeys.clientIdKey,
    );
    const String clientSecretString = String.fromEnvironment(
      WindowsSecretKeys.clientSecret,
    );

    _clientId = auth_lib.ClientId(clientIdString, clientSecretString);
  }

  @override
  Future<Map<String, dynamic>> signIn() async {
    try {
      authClient = await auth_lib.clientViaUserConsent(
        _clientId,
        _scopesForSharing,
        _userPrompt,
        baseClient: initAndGetInnerClient(),
      );
      return authClient!.credentials.toJson();
    } on auth_lib.ServerRequestFailedException catch (serverException) {
      if (serverException.statusCode == HttpStatus.badRequest) {
        throw UnauthorizedCredsException();
      } else {
        rethrow;
      }
    } on SocketException catch (e) {
      if (e.osError?.errorCode == ExceptionCode.noInternetSocketWindows) {
        throw NoInternetException();
      } else {
        rethrow;
      }
    } on auth_lib.AccessDeniedException catch (_) {
      throw UnauthorizedCredsException();
    }
  }

  @override
  Future<Map<String, dynamic>> requestSharingScopes() => signIn();

  @override
  String? get signedEmail => null;
  @override
  String? get signedName => null;

  @override
  Future<void> cleanUserCache() async {}

  @override
  Future<void> signOut() => super.closeBaseClient();
  @override
  Future<void> revokeAuth() => super.closeBaseClient();

  List<String> get _scopesForSharing => GoogleAuthConfig.cloudSyncScopes;

  @override
  bool get isToMeSharingAvailable {
    if (authClient == null) return false;
    bool isSuccess = true;
    final clientScopes = authClient!.credentials.scopes;
    for (var requestScope in _scopesForSharing) {
      if (!clientScopes.contains(requestScope)) {
        isSuccess = false;
      }
    }
    return isSuccess;
  }

  void _userPrompt(String urlString) async {
    urlString = _handleUrlAccessType(urlString);
    final uri = Uri.parse(urlString);
    if (await url_lib.canLaunchUrl(uri)) {
      await url_lib.launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  String _handleUrlAccessType(String urlString) {
    return urlString;
  }

  @override
  Future<bool> get isSignedIn async =>
      authClient != null && !authClient!.credentials.accessToken.hasExpired;

  @override
  Stream<Map<String, dynamic>>? get credsUpdateStream =>
      authClient?.credentialUpdates.map((accessCreds) => accessCreds.toJson());

  @override
  Future<bool?> tryRestoreAuthByTokens(credentialsJson) async {
    if (credentialsJson == null) {
      return null;
    }
    try {
      final credentials = auth_lib.AccessCredentials.fromJson(credentialsJson);

      final updatedCreds = await auth_lib.refreshCredentials(
        _clientId,
        credentials,
        initAndGetInnerClient(),
      );
      authClient = auth_lib.autoRefreshingClient(
        _clientId,
        updatedCreds,
        initAndGetInnerClient(),
      );

      return isSignedIn;
    } on auth_lib.ServerRequestFailedException catch (serverException) {
      if (serverException.statusCode == HttpStatus.badRequest) {
        throw UnauthorizedCredsException();
      } else {
        rethrow;
      }
    } on SocketException catch (e) {
      if (e.osError?.errorCode == ExceptionCode.noInternetSocketWindows) {
        throw NoInternetException();
      } else {
        rethrow;
      }
    } on auth_lib.AccessDeniedException catch (_) {
      throw UnauthorizedCredsException();
    }
  }
}
