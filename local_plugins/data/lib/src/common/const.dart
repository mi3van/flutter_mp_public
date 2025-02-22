import 'package:domain/domain.dart'
    show ImageCompressType, Role, SortType, SyncFrequencyType, ThemeType;

const isarUsersDbName = 'isarUserDb';
const isarUserItemsDbName = 'isarItemDb';
const isarUserFilesDbName = 'isarFileDb';

// const check = Isar.defaultMaxSizeMiB;
// Isar default is 1024 Mib.
const isarUsersDbRAM = 16;
const isarUserItemsDbRAM = 256;
const isarUserFilesDbRAM = 752;

const syncCloudKeyBytesLimit = 1;
const syncCloudUuidKey = "u";

const cloudItemsPageSize = 192;
const cloudFilesPageSize = 64;

const isarOveflowFileMessage = "Unexpected extension byte";

const collectAmountJsonMonthKey = "month";
const collctAmountJsonCurrentKey = "current";
const collectAmountJsonTotalKey = "total";

// Settings
const settingsDefaultSyncFrequency = SyncFrequencyType.daily;
const settingsDefaultTheme = ThemeType.auto;
const settingsDefaultWelcomeWathed = false;
final settingsDefaultSortTypeValue = SortType.created.value;
const settingsDefaultImageCompress = ImageCompressType.medium;
const settingsDefaultTooltipsWatched = 0;
const settingsDefaultColumnsCount = 4;
const settingsDefaultIsPrintReportUiMode = false;
const settingsDefaultIsCameraFlashEnabled = false;

const userDefaultLocalRole = Role.defaultLocal;
