
// import 'package:googleapis_auth/auth_browser.dart' as auth_lib;
// 
// 

// class GoogleBrowserAuthApi
//     extends BaseGoogleAuthApi<auth_lib.AutoRefreshingAuthClient> {
//   @override
//   Future<Map<String, dynamic>> signIn() async {
//     if (authClient == null) {
//       final flow = await auth_lib.createImplicitBrowserFlow(
//           clientId, GoogleConfig.appScopes);
//       //   return flow.clientViaUserConsent(forceUserConsent: false).catchError((_) {
//       //   loginButton.text = '';
//       //   return loginButton.onClick.first.then((_) {
//       //     return flow.clientViaUserConsent(forceUserConsent: true);
//       //   });
//       // }, test: (error) => error is auth.UserConsentException);
//     }

//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> get isSignedIn async =>
//       authClient != null && !authClient!.credentials.accessToken.hasExpired;

//   @override
//   Stream<Map<String, dynamic>>? get credsUpdateStream =>
//       authClient?.credentialUpdates.map((accessCreds) => accessCreds.toJson());

//   @override
//   Future<bool?> tryRestoreAuthByTokens(credentialsJson) async {
//     if (credentialsJson == null) {
//       return null;
//     }
//     final credentials = auth_lib.AccessCredentials.fromJson(credentialsJson);
//     final client = initAndGetInnerClient();

//     // final updatedCreds = await auth_lib.refreshCredentials(
//     //   clientId!,
//     //   credentials,
//     //   client,
//     // );
//     authClient = auth_lib.autoRefreshingClient(
//       clientId,
//       credentials,
//       client,
//     );

//     return authClient != null;
//   }
// }
