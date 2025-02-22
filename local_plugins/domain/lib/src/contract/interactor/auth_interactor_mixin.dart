mixin AuthInteractorMixin implements BaseInterRepoApiAuthMixin {
  bool get isAuth;
  Future<bool> signIn();
  Future<bool> requestSharingScopes();
  Future<bool> tryRestoreAuthFirstInit();
  Future<bool> tryRestoreAuth();
  Future<bool> isCredentialsExistForUi();
  String get signedPermissionIdThrow;
  void isScopesToMeSharingAvailableThrow();
}

mixin BaseInterRepoApiAuthMixin {
  Future<void> signOut();
  Future<void> revokeAuth();
  String? get signedEmail;
  String? get signedName;
}

mixin BaseRepoApiAuthMixin implements BaseInterRepoApiAuthMixin {
  bool get isToMeSharingAvailable;
// Return credentials to encode and save
  Future<Map<String, dynamic>> signIn();
  Future<Map<String, dynamic>> requestSharingScopes();
  Future<void> cleanUserCache();
}
