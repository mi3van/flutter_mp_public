import 'dart:math' show pi;

import 'package:domain/domain.dart';

const appSupportEmail = 'mi3van.sup@gmail.com';
const policyLink = 'https://mi3van.github.io/my.p/#/privacy';
const minYearValue = 2025;
const appName = 'My Precious';
const appNameStart = 'My';
const premiumName = 'Premium';
const appFolderEnd = 'App';
const qrName = 'QR';
const appAbbreviature = 'MP';
const elementsFolderName = 'Elements';
const eventsFolderName = 'Events';
const itemFolderName = 'Item';
const fileFolderName = 'BlobFile';
const int coreDbVersion = 4;

const rootUuid = "-|-";
const depthSymbol = "*";

const int daysInWeek = 7;

const snackBarAnimationMillis = 400;
const snackBarDurationFast = Duration(seconds: 1);
const snackBarDurationRegular = Duration(seconds: 2);
const snackBarDurationSlow = Duration(seconds: 3);

const maxImagsInItem = 5;
const maxImagesForGroupPick = 100;
const filesCacheLength = 10;

const defaultExportType = ExportFileType.backup;
const filePasswCharsMoreThan = 2;
const itemDataFieldName = "imagePreviewByte";
const blobDataFieldName = "dataByte";

const luckyItemsPageSize = 8;

// System
const whileMaxCount = 100000;

const imageMaxLengthInBytes = 16777216; // 16 MB is max for Isar
const imageJpgCompressQuality = 80;

// Native is 64-bit max.
const int maxSafeNativeInt = 0x7FFFFFFFFFFFFFFF;
const int minSafeNativeInt = -0x8000000000000000;

// Web is 32-bit max. No need yet.
// final int maxSafeWebInteger = double.maxFinite.toInt();
// final int minSafeWebInteger = -double.maxFinite.toInt();

// The total should be 124 bytes for Drive
const syncCloudPropertyBytesLimit = 123;
const syncCloudPropTwoBytesLimit = syncCloudPropertyBytesLimit << 1; // l * 2

const appExitCheckIntervalInMs = Duration.millisecondsPerSecond << 1; // ms * 2
const inDbEventsCountMax = 1000;
const inCloudEventsCountMax = 8000;

// 8 days interval for check additional shared for cloud-users.
const checkSharedUsersCountIntervalMs = Duration.millisecondsPerDay << 3;
// 32 days interval for check donation and show alert.
const checkLastDonationIntervalMs = Duration.millisecondsPerDay << 5;

const slowDebounceDuration = Duration(milliseconds: 300);
const regularDebounceDuration = Duration(milliseconds: 200);
const shareToUsersMaxCount = 5;

const degree45Angle = pi / 4;
const degree90Angle = pi / 2;

const imageMinCompressSmallerSide = 1024;
const imageMediumCompressSmallerSide = 512;
const imageMaxCompressSmallerSide = 256;
const previewImageSmallerSide = 128;

// Languages
String getLocaleFullNativeName(String key) {
  if (_isoLangs.containsKey(key)) {
    return _isoLangs[key]!["nativeName"]!;
  } else {
    throw Exception("Language key is incorrect");
  }
}

final qrUnavSymbolsRegexp = RegExp(
  "[^\\w!@#\$%^&*()\\\\ \",.?':{}\\[\\]|<>+-/;=`~]",
);
final fileUnavSymbolsRegexp = RegExp(
  '[ \\/:*?"<>|]',
);

const autoLocaleCode = "--";
const defLocaleCode = "en";

const _isoLangs = {
  autoLocaleCode: {"name": "Device language", "nativeName": "Auto"},
  "ar": {"name": "Arabic", "nativeName": "اَلْعَرَبِيَّةُ"},
  "da": {"name": "Danish", "nativeName": "Dansk"},
  "de": {"name": "German", "nativeName": "Deutsch"},
  "en": {"name": "English", "nativeName": "English"},
  "es": {"name": "Spanish", "nativeName": "Español"},
  "fi": {"name": "Finnish", "nativeName": "Suomi"},
  "fr": {"name": "French", "nativeName": "Français"},
  "hi": {"name": "Hindi", "nativeName": "हिन्दी"},
  "hu": {"name": "Hungarian", "nativeName": "Magyar"},
  "id": {"name": "Indonesian", "nativeName": "Indonesia"},
  "it": {"name": "Italian", "nativeName": "Italiano"},
  "ja": {"name": "Japanese", "nativeName": "日本語"},
  "ko": {"name": "Korean", "nativeName": "한국어"},
  "nl": {"name": "Dutch", "nativeName": "Nederlands"},
  "no": {"name": "Norwegian", "nativeName": "Norsk (Bokmål)"},
  "pt": {"name": "Portuguese", "nativeName": "Português"},
  "ru": {"name": "Russian", "nativeName": "Русский"},
  "sv": {"name": "Swedish", "nativeName": "Svenska"},
  "ur": {"name": "Urdu", "nativeName": "اُردُو"},
  "zh": {"name": "Simplified Chinese", "nativeName": "官话"},
};

const pdfFileExt = 'pdf';
const sheetFileExt = 'xlsx';
const textFileExt = 'txt';
const backupFileExt = 'mm';

const imgsAvailblExt = [jpgFileExt, jpegFilExt, gifFileExt, pngExt, webpFileEx];

const jpgFileExt = "jpg";
const jpegFilExt = "jpeg";
const gifFileExt = "gif";
const pngExt = "png";
const webpFileEx = "webp";

const internetCheckTimeout = Duration(milliseconds: 1500);

const commonInternetCheckAddresses = {
  "https://ifconfig.me/ip",
  "https://use.opendns.com/",
};

const String currEuroSymb = "€";
