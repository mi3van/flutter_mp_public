import 'dart:typed_data';

mixin HttpApiMixin {
  Future<Uint8List> getNetworkImageData(String link);

  Future<void> justSimpleInternetFetch(Set<String> addresses);

  Future<String> myGet(String url, {Map<String, String>? headers});
}
