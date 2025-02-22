import 'package:domain/src/contract/interactor/auth_interactor_mixin.dart';

mixin AuthRepositoryMixin on BaseRepoApiAuthMixin {
  Future<bool?> tryRestoreAuthByTokens(Map<String, dynamic>? credentials);
  Future<bool> isSignedIn();
  Stream<Map<String, dynamic>>? get credsUpdateStream;
}
