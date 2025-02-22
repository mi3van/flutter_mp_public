import 'dart:typed_data';

import 'package:domain/domain.dart';

class ImageToCompress {
  ImageToCompress(
    this.originalImageData,
    this.imageFormat,
  );

  Uint8List originalImageData;
  final MyFileType imageFormat;
}
