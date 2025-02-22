// Basic application configurations
import 'package:domain/domain.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as l;
import 'package:my_precious/presentation/common/contract/service_locator/palette_mixin.dart'
    as p;
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/app_bar.dart';

const appVersionDisplay = '2025.1.2';

const rootRestorationId = "rootRestorationId";
const appStateRestorationId = "applicationState_restorationId";
const isBodyExtend = true;
// const isDebugWidgetsOn = kDebugMode && false;

// Default settings
const elementHeightHuge = 96.0;
const elementHeightMega = 72.0;
const elementHeightBig = 56.0;
const elementHeightRegular = 40.0;
const elementHeightSmall = 32.0;
const elementHeightSmaller = 26.0;
const elementHeightMicro = 20.0;
const elementHeightNano = 14.0;
const elementIconSizeBig = 36.0;
const elementIconSizeRegular = 24.0;
const elementIconSizeMini = 18.0;

const paddingHuge = 26.0;
const paddingBig = 22.0;
const paddingRegular = 16.0;
const paddingSmall = 12.0;
const paddingSmaller = 8.0;
const paddingMicro = 4.0;
const paddingForChip = 2.0;

const borderRadiusBig = 16.0;
const borderRadiusRegular = 12.0;
const borderRadiusSmall = 8.0;

const fabMinHeight = 48.0;
const fabBorderRadius = borderRadiusBig;
const fabBarMargin = 6.0;
// Shadow diff
const fabBarBorderRadius = fabBorderRadius + fabBarMargin - 2.0;

const animationDurationFast = Duration(milliseconds: 300);
const animationDurationRegular = Duration(milliseconds: 600);
const animationDurationSlow = Duration(milliseconds: 900);
const animationDurationSlowest = Duration(milliseconds: 2000);

const pageTransitionDuration = animationDurationRegular;
const tooltipWaitDuration = animationDurationRegular;
const itemSwitchDuration = animationDurationRegular;
const isItemInSwitchAnimDuration = Duration(milliseconds: 400);
const hideAlertDuration = Duration(milliseconds: 200);

// Elements design config-s
const elevationRegular = 4.0;
final elevationRegularInt = elevationRegular.toInt();
const elevationRegularClicked = 8.0;

const buttonSplashRadius = 28.0;
const tooltipMaxSize = 150.0;
const dropdownBtnMaxWidth = 90.0;
const drawerMaxWidth = 300.0;

const itemDetailsImageMaxHeight = 170.0;

const itemCategoryHeight = 24.0;
const titleTextFieldHeightCoef = 1.2;
const descrTextFieldMaxLines = 5;
const depthItemImageOpacity = 0.85;

// Widget coordinates setup
const appBarContentMaxHeight = elementHeightRegular;
const headerInSliverHeight = elementHeightRegular;
const itemCircleWidgetMiniHeight = 24.0;
const itemCircleWidgetHeight = elementHeightRegular;
const itemCircleWidgetBigSize = elementHeightBig;

const syncProgressWidgetSize = elementHeightRegular;
const itemSyncWidgetPadding =
    (PreciousSliverAppBar.defaultWidgetHeight - syncProgressWidgetSize) / 2;

const itemHorizontalImageAspectRatio = 1.4;
const itemMiniImageAspectRatio = 1.25;
const itemDetailImageAspectRatio = itemHorizontalImageAspectRatio; //1.6;

// Barcode confings
const printPageHeaderHeight = 44.0;
const printColumnsMinSize = 1.0;
const printColumnsMaxSize = 10.0;
const printReportRowMaxLines = 10;

const barcodeAspectRatio = 1.0;
const fontSizeSmall = 6.0;
const maxPdfTablePagesForUi = 75;
const maxPdfTablePagesValue = maxPdfTablePagesForUi - 1;

// Item details configs
const textFieldItemTitleLength = 80;
const textFieldItemMaxLength = syncCloudPropertyBytesLimit;
const textFieldEmailLength = 255;
const textFieldCommaSeparatedLength = 2048;
const textFieldSearchItemLength = textFieldItemTitleLength;
const textFieldItemDescriptionLength = syncCloudPropTwoBytesLimit;
final itemFirstDateAvailable = DateTime(0);
final unavailableDate = DateTime(-1);
const defaultDatePattern = "M/d/y";

typedef AppCntxt = m.BuildContext;
typedef AppLocale = l.AppLocalizations;
typedef AppLocaleM = m.MaterialLocalizations;
typedef AppTheme = m.ThemeData;
typedef AppPalette = p.PaletteMixin;
const defaultLocale = m.Locale(autoLocaleCode);
const appSupportLocales = [defaultLocale, ...AppLocale.supportedLocales];
final Map<String, String> localeNames = {
  for (var locale in appSupportLocales)
    locale.toLanguageTag(): getLocaleFullNativeName(locale.toString())
};

const cryptoTRC20Title = "USDT (TRC20)";
const cryptoERC20Title = "USDT (ERC20)";
const cryptoBitcoinTitle = "BTC (Bitcoin)";
const cryptoTonTitle = "TON (TON)";

// Mobile ui-settings.
const mobileButtonMaxWidth = 500.0;

const genAlertBarrierDefColor = m.Color(0x40000000);
const genAlertBarrierLightColor = m.Color(0x20000000);

final translationAuthors =
    "${getLocaleFullNativeName("hu")} - Bálint Németh (BalintH)";
