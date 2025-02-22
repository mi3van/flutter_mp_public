import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

class HttpRepository implements HttpRepositoryMixin {
  late final HttpApiMixin _httpApi = HttpApi();

  @override
  Future<Uint8List> getNetworkImageData(String link) {
    return _httpApi.getNetworkImageData(link);
  }

  @override
  Future<void> internetFetch() async {
    return _httpApi.justSimpleInternetFetch(_internetCheckAddresses);
  }

  late final _internetCheckAddresses = {
    rLocator.marketRepository.internetCheckAddress,
    ...commonInternetCheckAddresses,
  };
}
