import 'dart:async';
import 'dart:ui';

import 'package:domain/domain.dart';

class SettingsInteractor with SettingsInteractorMixin {
  final _userSettingsRepo = iLocator.userSettingsRepository;
  final _syncFrequencyStreamControl =
      StreamController<SyncFrequencyType>.broadcast();
  final _imageCompressStreamControl =
      StreamController<ImageCompressType>.broadcast();

  UserSettings? userSettings;

  @override
  void cleanValues() => userSettings = null;

  @override
  void onDispose() => cleanValues();

  @override
  Future<SyncFrequencyType> getSyncFrequencyType() async {
    return (await _getUserSettings()).syncFrequency;
  }

  @override
  Future<void> updateSyncFrequency(newSyncFrequency) async {
    final userSettings = await _getUserSettings();

    userSettings.syncFrequency = newSyncFrequency;
    final settingsId = await _userSettingsRepo.updateOriginalUserSettings(
      userSettings,
    );

    if (settingsId != userSettings.localId) {
      throw DataSavingException(dataPart: 'SyncFrequency');
    }
    _syncFrequencyStreamControl.add(newSyncFrequency);
  }

  @override
  Stream<SyncFrequencyType> getSyncFrequencyTypeStream() =>
      _syncFrequencyStreamControl.stream;

  @override
  Future<ImageCompressType> getImageCompressType() async {
    return (await _getUserSettings()).imageCompress;
  }

  @override
  Future<void> updateImageCompressType(
    ImageCompressType newImageCompressType,
  ) async {
    final userSettings = await _getUserSettings();

    userSettings.imageCompress = newImageCompressType;
    final settingsId = await _userSettingsRepo.updateOriginalUserSettings(
      userSettings,
    );

    if (settingsId != userSettings.localId) {
      throw DataSavingException(dataPart: 'ImageCompress');
    }
    _imageCompressStreamControl.add(newImageCompressType);
  }

  @override
  Stream<ImageCompressType> getImageCompressTypeStream() =>
      _imageCompressStreamControl.stream;

  @override
  Future<String> getLocalizationCode() async {
    return (await _getUserSettings()).localeCode;
  }

  @override
  Future<void> updateLocaleCode(String newLocaleCode) async {
    final userSettings = await _getUserSettings();

    userSettings.localeCode = newLocaleCode;
    final settingsId =
        await _userSettingsRepo.updateOriginalUserSettings(userSettings);

    if (settingsId != userSettings.localId) {
      throw DataSavingException(dataPart: 'LocaleCode');
    }
  }

  @override
  ({Locale locale, String fullCode}) getCorrectLocale({
    required String localeCode,
    required String systemCode,
  }) {
    if (localeCode == autoLocaleCode) {
      for (var supportedLocale in iLocator.supportLocales) {
        if (supportedLocale.languageCode == systemCode ||
            systemCode.startsWith(supportedLocale.languageCode)) {
          // Return auto-found language.
          return (locale: supportedLocale, fullCode: systemCode);
        }
      }
      // Return default language.
      return (locale: const Locale(defLocaleCode), fullCode: systemCode);
    } else {
      // Return user-selected language.
      return (locale: Locale(localeCode), fullCode: systemCode);
    }
  }

  @override
  Future<ThemeType> getThemeType() async {
    return (await _getUserSettings()).theme;
  }

  @override
  Future<void> updateThemeType(ThemeType newTheme) async {
    final userSettings = await _getUserSettings();

    userSettings.theme = newTheme;
    final settingsId =
        await _userSettingsRepo.updateOriginalUserSettings(userSettings);

    if (settingsId != userSettings.localId) {
      throw DataSavingException(dataPart: 'Theme');
    }
  }

  @override
  Future<bool> isWelcomeWathed() async {
    return (await _getUserSettings()).isWelcomeWathed;
  }

  @override
  Future<void> updateWelcomeWathed(bool newWelcomeWatched) async {
    final userSettings = await _getUserSettings();

    userSettings.isWelcomeWathed = newWelcomeWatched;
    final settingsId =
        await _userSettingsRepo.updateOriginalUserSettings(userSettings);

    if (settingsId != userSettings.localId) {
      throw DataSavingException(dataPart: 'Welcome watched');
    }
  }

  @override
  Future<SortModel> getSortModel() async {
    final repoModel = (await _getUserSettings()).sortModel;
    return repoModel.clone;
  }

  @override
  Future<void> updateSortModelAndCleanItemCache(SortModel newSortModel) async {
    final userSettings = await _getUserSettings();

    if (newSortModel == userSettings.sortModel) {
      return;
    }
    userSettings.sortModel = newSortModel.clone;
    final settingsId =
        await _userSettingsRepo.updateOriginalUserSettings(userSettings);

    if (settingsId != userSettings.localId) {
      throw DataSavingException(dataPart: 'Sort model');
    }
    // Needs for update items lists
    // iLocator.itemCacheInteractor.cleanValues();
  }

  Future<UserSettings> _getUserSettings() async {
    return userSettings ??= await _userSettingsRepo.getOriginalUserSettings();
  }

  @override
  Future<int> getTooltipsWathed() async {
    return (await _getUserSettings()).tooltipsWatched;
  }

  @override
  Future<void> updateTooltipsWathed(int newTooltipsValue) async {
    final userSettings = await _getUserSettings();

    userSettings.tooltipsWatched = newTooltipsValue;
    final settingsId =
        await _userSettingsRepo.updateOriginalUserSettings(userSettings);

    if (settingsId != userSettings.localId) {
      throw DataSavingException(dataPart: 'Tootlips watched');
    }
  }
}
