import 'package:domain/domain.dart';

enum ImageCompressType {
  min(_minSettingsValue, imageMinCompressSmallerSide),
  medium(_medSettingsValue, imageMediumCompressSmallerSide),
  max(_maxSettingsValue, imageMaxCompressSmallerSide),
  preview(_previewSettingsValue, previewImageSmallerSide),
  ;

  const ImageCompressType(this.settingsValue, this.smallerSide);
  final int settingsValue;
  final int smallerSide;

  static ImageCompressType fromInt(int value) {
    switch (value) {
      case _medSettingsValue:
        return ImageCompressType.medium;
      case _maxSettingsValue:
        return ImageCompressType.max;
      default:
        return ImageCompressType.min;
    }
  }
}

const _minSettingsValue = 1;
const _medSettingsValue = 2;
const _maxSettingsValue = 3;
const _previewSettingsValue = -1;
