import 'package:domain/domain.dart';

enum MyFileType {
  any("any"),
  media("media"),
  image(jpgFileExt),
  custom(jpegFilExt),
  video("video"),
  audio("audio"),
  imagePng(pngExt),
  ;

  final String format;

  const MyFileType(this.format);
}
