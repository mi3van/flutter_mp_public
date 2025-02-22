import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:my_precious/presentation/common/contract/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious/service_locator.dart';

class SettingsController implements SettingsModelControllerMixin {
  SettingsInteractorMixin get _interactor => cLocator.settingsInteractor;

  // Need for exclude async gap
  @override
  late bool isWelcomeWatched;

  @override
  final ValueNotifier<bool> isSettingsLoadingNotifier = ValueNotifier(false);
  @override
  final ValueNotifier<String> selectedLocaleNotifier = ValueNotifier(
    autoLocaleCode,
  );
  @override
  final ValueNotifier<ThemeType> themeNotifier = ValueNotifier(
    settingsDefaultTheme,
  );
  @override
  final ValueNotifier<SyncFrequencyType> syncFrequencyNotifier = ValueNotifier(
    settingsDefaultSyncFrequency,
  );
  @override
  final ValueNotifier<ImageCompressType> imageCompressNotifier = ValueNotifier(
    settingsDefaultImageCompress,
  );
  @override
  late SortModel sortModel;

  @override
  Future<void> onInit() async {
    selectedLocaleNotifier.value = await _interactor.getLocalizationCode();
    themeNotifier.value = await _interactor.getThemeType();
    syncFrequencyNotifier.value = await _interactor.getSyncFrequencyType();
    imageCompressNotifier.value = await _interactor.getImageCompressType();
    sortModel = await _interactor.getSortModel();
    isWelcomeWatched = await _interactor.isWelcomeWathed();
  }

  @override
  void cleanValues() {
    _interactor.cleanValues();
    // Call onInit for update
  }

  @override
  void onDispose() {
    _interactor.onDispose();

    isSettingsLoadingNotifier.dispose();
    selectedLocaleNotifier.dispose();
    themeNotifier.dispose();
    syncFrequencyNotifier.dispose();
    imageCompressNotifier.dispose();
  }

  @override
  Future updateSyncFrequency(SyncFrequencyType newSyncFrequency) async {
    isSettingsLoadingNotifier.value = true;

    await _interactor.updateSyncFrequency(newSyncFrequency);
    syncFrequencyNotifier.value = newSyncFrequency;

    isSettingsLoadingNotifier.value = false;
  }

  @override
  void syncFrequencyInfoClick() {
    cLocator.appAlertController.showInfoAlert(SyncFrequencyInfo());
  }

  @override
  Future<void> updateImageCompressType(
    ImageCompressType newImageCompress,
  ) async {
    isSettingsLoadingNotifier.value = true;

    await _interactor.updateImageCompressType(newImageCompress);
    imageCompressNotifier.value = newImageCompress;

    isSettingsLoadingNotifier.value = false;
  }

  @override
  void imageCompressInfoClick() {
    cLocator.appAlertController.showInfoAlert(ImageCompressInfo());
  }

  @override
  Future updateTheme(ThemeType themeType) async {
    isSettingsLoadingNotifier.value = true;

    await _interactor.updateThemeType(themeType);
    themeNotifier.value = themeType;

    isSettingsLoadingNotifier.value = false;
  }

  @override
  Future updateLocalizationCode(String? newLocaleCode) async {
    if (newLocaleCode == null) {
      return;
    }
    isSettingsLoadingNotifier.value = true;

    await _interactor.updateLocaleCode(newLocaleCode);

    selectedLocaleNotifier.value = newLocaleCode;

    isSettingsLoadingNotifier.value = false;
  }

  @override
  Future<void> updateWelcomeWathed(bool newWelcomeWatched) async {
    await _interactor.updateWelcomeWathed(newWelcomeWatched);
  }

  @override
  Future<void> updateSortModel(SortModel newSortModel) async {
    isSettingsLoadingNotifier.value = true;

    sortModel = newSortModel;
    await _interactor.updateSortModelAndCleanItemCache(sortModel);

    isSettingsLoadingNotifier.value = false;
  }
}
