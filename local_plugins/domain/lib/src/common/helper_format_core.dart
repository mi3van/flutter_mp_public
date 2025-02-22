import 'package:domain/domain.dart';

abstract class HelperFormatCore {
  static MyFileType getImageFormat(String filename) {
    final endFormat = _getFileFormatString(filename);
    switch (endFormat) {
      case jpgFileExt:
      case jpegFilExt:
        return MyFileType.image;
      case gifFileExt:
      case pngExt:
      case webpFileEx:
        return MyFileType.imagePng;
      default:
        return MyFileType.any;
    }
  }
}

String _getFileFormatString(String filename) {
  return filename.length > 3
      ? (filename.substring(filename.length - 4)).replaceFirst(".", "")
      : "";
}
