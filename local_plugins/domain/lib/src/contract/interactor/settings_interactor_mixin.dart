import 'dart:ui';

import 'package:domain/src/common/entity/dto/sort_model.dart';
import 'package:domain/src/common/entity/enums/image_compress_type.dart';
import 'package:domain/src/common/entity/enums/sync_frequency_type.dart';
import 'package:domain/src/common/entity/enums/theme_type.dart';
import 'package:domain/src/contract/common/init_dispose_mixin.dart';

mixin SettingsInteractorMixin implements DisposeMixin {
  ({Locale locale, String fullCode}) getCorrectLocale({
    required String localeCode,
    required String systemCode,
  });

  Future<String> getLocalizationCode();
  Future<void> updateLocaleCode(String newLocaleCode);

  Future<SyncFrequencyType> getSyncFrequencyType();
  Future<void> updateSyncFrequency(SyncFrequencyType newSyncFrequency);
  Stream<SyncFrequencyType> getSyncFrequencyTypeStream();

  Future<ImageCompressType> getImageCompressType();
  Future<void> updateImageCompressType(ImageCompressType newImageCompressType);
  Stream<ImageCompressType> getImageCompressTypeStream();

  Future<ThemeType> getThemeType();
  Future<void> updateThemeType(ThemeType newTheme);

  Future<bool> isWelcomeWathed();
  Future<void> updateWelcomeWathed(bool newWelcomeWatched);

  Future<SortModel> getSortModel();
  Future<void> updateSortModelAndCleanItemCache(SortModel newSortModel);

  Future<int> getTooltipsWathed();
  Future<void> updateTooltipsWathed(int newTooltipsValue);
}
