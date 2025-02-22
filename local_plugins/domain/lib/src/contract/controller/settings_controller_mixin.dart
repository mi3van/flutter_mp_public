import 'package:domain/src/common/entity/dto/sort_model.dart';
import 'package:domain/src/common/entity/enums/image_compress_type.dart';
import 'package:domain/src/common/entity/enums/sync_frequency_type.dart';
import 'package:domain/src/common/entity/enums/theme_type.dart';
import 'package:domain/src/contract/common/init_dispose_mixin.dart';

mixin SettingsControllerMixin<T> implements InitDisposeMixin {
  Future<void> updateSyncFrequency(SyncFrequencyType newSyncFrequency);
  void syncFrequencyInfoClick();

  Future<void> updateImageCompressType(ImageCompressType newImageCompress);
  void imageCompressInfoClick();

  Future<void> updateTheme(ThemeType themeType);

  Future<void> updateLocalizationCode(String? newLocaleCode);

  Future<void> updateWelcomeWathed(bool newWelcomeWatched);

  Future<void> updateSortModel(SortModel newSortModel);
}
