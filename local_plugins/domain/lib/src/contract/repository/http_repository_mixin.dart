import 'dart:typed_data';

mixin HttpRepositoryMixin {
  Future<Uint8List> getNetworkImageData(String link);

  Future<void> internetFetch();
}
