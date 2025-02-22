import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

mixin SettingsModelControllerMixin
    implements SettingsControllerMixin, SettingsModelMixin, InitDisposeMixin {}

mixin SettingsModelMixin {
  ValueNotifier<bool> get isSettingsLoadingNotifier;
  ValueNotifier<SyncFrequencyType> get syncFrequencyNotifier;
  ValueNotifier<ImageCompressType> get imageCompressNotifier;
  ValueNotifier<ThemeType> get themeNotifier;
  ValueNotifier<String> get selectedLocaleNotifier;
  bool get isWelcomeWatched;
  SortModel get sortModel;
}
