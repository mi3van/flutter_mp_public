import 'dart:ui';

import 'package:domain/domain.dart';

mixin LocalesControllerMixin<C, L, M> {
  L get locale;
  String get code;
  M get localeM;
  String get currencySymbol;
  double get currencyEndPadding;
  Locale codeToPlatformLocale(String localeCode);
  void setupLocales(C context);

  String getAlertTypeTitle(AlertType type);
  String getBaseExceptionMessage(BaseException baseException);
  String getAlertActionTitle(ActionAlertTextCode type,
      {required String descriptionAddon});
  String getSyncTypeTitle(SyncFrequencyType type);
  String getThemeTypeTitle(ThemeType type);
  String getSortTypeTitle(SortType sortType);
  String getImageCompressTitle(ImageCompressType compressType);
  String getExportTypeTitle(ExportFileType exportType);
  String getExportFileClmnName(ExportFileColumnType fileClmnType);
  String localizeSnackbarCode(SnackbarCodeType snackMessageCode);

  String get dividerDot;
  String get inventoryTitle;
  String getYmdDateTCheck(DateTime dateTime);
  String nowFullDateTxt();
}
