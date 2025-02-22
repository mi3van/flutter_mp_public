import 'package:data/src/contract/auth_api_mixin.dart';
import 'package:http/http.dart' as http;

abstract class BaseAuthApi<T extends http.Client> implements AuthApiMixin {
  @override
  T? authClient;

  http.Client? _innerClient;

  Future<void> closeBaseClient() async {
    _cleanAuthClient();
  }

  http.Client initAndGetInnerClient() => _innerClient ??= http.Client();

  void _cleanAuthClient() {
    authClient?.close();
    authClient = null;
    try {
      _innerClient?.close();
    } catch (e) {
      // Main authClient can auto-close inner client (platform depends)
    }
    _innerClient = null;
  }
}
