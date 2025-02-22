import 'package:http/http.dart' as http;

mixin AuthRequiredMixin {
  http.Client? get authClient;
}
