import 'package:domain/domain.dart';

enum ExportFileType {
  sheet(sheetFileExt),
  text(textFileExt),
  backup(backupFileExt),
  ;

  const ExportFileType(this.format);
  final String format;
}

enum ExportFileColumnType {
  depthLevel,
  itemType,
  titleAndDescr,
  serialNum,
  itemDate,
  estValue,
  isFavorite,
  qrBarcode,
}
