import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepository implements AuthRepositoryMixin {
  final _api = rLocator.authApi..onFirstInit();

  @override
  Future<bool?> tryRestoreAuthByTokens(credentials) async {
    try {
      return await _api.tryRestoreAuthByTokens(credentials);
    } catch (e) {
      // Was delete user credentials
      // print(e);
      return false;
    }
  }

  @override
  Future<void> cleanUserCache() async {
    return _api.cleanUserCache();
  }

  @override
  Future<Map<String, dynamic>> signIn() => _api.signIn();
  @override
  Future<Map<String, dynamic>> requestSharingScopes() =>
      _api.requestSharingScopes();

  @override
  Future<void> signOut() => _api.signOut();
  @override
  Future<void> revokeAuth() => _api.revokeAuth();

  @override
  Stream<Map<String, dynamic>>? get credsUpdateStream => _api.credsUpdateStream;

  @override
  String? get signedEmail => _api.signedEmail;
  @override
  String? get signedName => _api.signedName;

  @override
  Future<bool> isSignedIn() => _api.isSignedIn;

  @override
  bool get isToMeSharingAvailable => _api.isToMeSharingAvailable;
}
