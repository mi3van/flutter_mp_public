import 'package:data/data.dart';
import 'package:domain/domain.dart';

mixin AuthApiMixin implements AuthRequiredMixin, BaseRepoApiAuthMixin {
  void onFirstInit();

  Future<bool> get isSignedIn;

  Future<bool?> tryRestoreAuthByTokens(Map<String, dynamic>? credentials);

  Stream<Map<String, dynamic>>? get credsUpdateStream;
}
