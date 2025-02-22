import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

class HttpApi implements HttpApiMixin {
  @override
  Future<Uint8List> getNetworkImageData(String imageLink) async {
    Response imgResponse = await get(
      Uri.parse(imageLink),
    );
    return imgResponse.bodyBytes;
  }

  @override
  Future<void> justSimpleInternetFetch(addresses) async {
    try {
      bool isSuccess = false;
      await Future.forEach(addresses, (address) async {
        if (!isSuccess) {
          final response = await get(Uri.parse(address))
              .timeout(internetCheckTimeout)
              .onError(
            (TimeoutException error, StackTrace stackTrace) {
              return Response("body", HttpStatus.badRequest);
            },
          );
          if (response.statusCode == HttpStatus.ok) isSuccess = true;
        }
      });
      if (isSuccess == false) throw NoInternetException();
    } on SocketException catch (e) {
      if (e.osError?.errorCode == ExceptionCode.noInternetSocketAndroid ||
          e.osError?.errorCode == ExceptionCode.noInternetSocketWindows) {
        throw NoInternetException();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<String> myGet(String url, {headers}) async {
    return (await get(Uri.parse(url), headers: headers)).body;
  }

  // Response response =
  //     await get('http://worldtimeapi.org/api/timezone/$continent/$country');
  // Map data = jsonDecode(response.body);
  // String dateTime = data['datetime'];
  // String offset = data['utc_offset'].substring(1, 3);
  // DateTime time = DateTime.parse(dateTime);
}
