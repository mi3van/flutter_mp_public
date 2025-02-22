import 'package:data/src/common/entity/isar_dto/db_basic_dto.dart';
import 'package:isar/isar.dart';

part 'db_user_settings.g.dart';

@Collection()
class DbUserSettings extends DbBasicDto {
  late Id id;
  String localeCode;
  int syncFrequencyValue;
  int imageCompressValue;
  int themingValue;
  bool isWelcomeWathed;
  byte sortModelValue;
  int tooltipsWatched;
  @Name("printColumnsSize")
  byte printQrColumnsCount;
  byte printReportColumnsCount;
  bool isPrintReportUiMode;
  bool isCameraFlashEnabled;

  DbUserSettings({
    required this.localeCode,
    required this.syncFrequencyValue,
    required this.imageCompressValue,
    required this.themingValue,
    required this.isWelcomeWathed,
    required this.sortModelValue,
    required this.tooltipsWatched,
    required this.printQrColumnsCount,
    required this.printReportColumnsCount,
    required this.isPrintReportUiMode,
    required this.isCameraFlashEnabled,
    int? dbId,
  }) {
    id = dbId ?? dbAutoId;
  }
}
