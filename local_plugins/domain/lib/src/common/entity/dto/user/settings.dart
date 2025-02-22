import 'package:domain/src/common/entity/dto/sort_model.dart';
import 'package:domain/src/common/entity/enums/image_compress_type.dart';

import 'package:domain/src/common/entity/enums/sync_frequency_type.dart';
import 'package:domain/src/common/entity/enums/theme_type.dart';

class UserSettings {
  final int localId;
  String localeCode;
  SyncFrequencyType syncFrequency;
  ImageCompressType imageCompress;
  ThemeType theme;
  bool isWelcomeWathed;
  SortModel sortModel;
  int tooltipsWatched;
  int printQrColumnsCount;
  int printReportColumnsCount;
  bool isPrintReportUiMode;
  bool isCameraFlashEnabled;

  UserSettings({
    required this.localId,
    required this.localeCode,
    required this.syncFrequency,
    required this.imageCompress,
    required this.theme,
    required this.isWelcomeWathed,
    required this.sortModel,
    required this.tooltipsWatched,
    required this.printQrColumnsCount,
    required this.printReportColumnsCount,
    required this.isPrintReportUiMode,
    required this.isCameraFlashEnabled,
  });
}
