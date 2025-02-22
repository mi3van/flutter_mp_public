import 'dart:io' show Platform;

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_format.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_ui_navigation.dart';
import 'package:my_precious/service_locator.dart';

class LocalesController
    implements LocalesControllerMixin<BuildContext, AppLocale, AppLocaleM> {
  @override
  AppLocale get locale => _locale!;
  @override
  late String code;
  @override
  late AppLocaleM localeM;
  @override
  late String currencySymbol;
  @override
  late double currencyEndPadding;

  AppLocale? _locale;

  @override
  Locale codeToPlatformLocale(localeCode) {
    final data = cLocator.settingsInteractor.getCorrectLocale(
      localeCode: localeCode,
      systemCode:
          //  kIsWeb ? WidgetsBinding.instance.platformDispatcher."locale.languageCode" :
          Platform.localeName,
    );
    code = data.fullCode;

    currencySymbol = HelperFormat.currencySymbol(code);
    currencyEndPadding = currencySymbol != currEuroSymb ? 0.0 : paddingMicro;

    return data.locale;
  }

  @override
  void setupLocales(BuildContext context) {
    final cntxtLocale = AppLocale.of(context)!;
    if (_locale == null) {
      _setupLocalesAction(context, cntxtLocale);
    } else if (_locale?.localeName != cntxtLocale.localeName) {
      _setupLocalesAction(context, cntxtLocale);
      HelperUiNavigation.rebuildAllChildren(context);
    }
  }

  void _setupLocalesAction(BuildContext context, AppLocale cntxtLocale) {
    _locale = cntxtLocale;
    localeM = AppLocaleM.of(context);
  }

  @override
  String getSyncTypeTitle(SyncFrequencyType type) {
    switch (type) {
      case SyncFrequencyType.daily:
        return "locale.syncFreqDailyTitle";
      case SyncFrequencyType.minutely:
        return "locale.syncFreqMinutelyTitle";
      case SyncFrequencyType.weekly:
        return "locale.syncFreqWeeklyTitle";
      case SyncFrequencyType.never:
        return "locale.syncFreqNeverTitle";
    }
  }

  @override
  String getAlertTypeTitle(AlertType type) {
    switch (type) {
      case AlertType.info:
        return "locale.infoTitle";
      case AlertType.warning:
        return "locale.warningTitle";
      case AlertType.error:
        return "locale.errorTitle";
      case AlertType.actionRequired:
        return "locale.actionRequiredTitle";
    }
  }

  @override
  String getThemeTypeTitle(ThemeType type) {
    switch (type) {
      case ThemeType.auto:
        return "locale.auto";
      case ThemeType.light:
        return "locale.lightTheme";
      case ThemeType.dark:
        return "locale.darkTheme";
    }
  }

  @override
  String getBaseExceptionMessage(BaseException baseException) {
    switch (baseException.code) {
      case ExceptionCode.commonInputValueException:
      case ExceptionCode.commonRequestException:
      case ExceptionCode.dataSavingException:
      case ExceptionCode.requestDataNotFoundException:
      case ExceptionCode.userUpdateException:
      case ExceptionCode.syncEventNotFoundException:
      case ExceptionCode.cloudFilePermissionException:
      case ExceptionCode.innerSyncAlreadyStartedException:
      case ExceptionCode.noFileException:
      case ExceptionCode.columnsNumberIsUnsupportedExcepion:
        return getDefaultText(baseException);
      case ExceptionCode.noCurrentItemException:
        return "locale.exceptionNoSelectedItemForAction";
      case ExceptionCode.notAuthUserException:
        return "locale.userMustBeAuthorized";
      case ExceptionCode.movingItemAlreadyHereException:
        return baseException is MovingItemAlreadyHereException
            ? "locale.moveItemAlreadyInPlace${baseException.itemTitles}"
            : getDefaultText(baseException);
      case ExceptionCode.movingItemThemselvesException:
        return baseException is MovingItemThemselvesException
            ? "locale.moveItemInToThemselves${baseException.itemTitles}"
            : getDefaultText(baseException);
      case ExceptionCode.movingItemTargetPathException:
        return baseException is MovingItemTargetPathException
            ? "locale.moveItemPathNotFoundMovingToRoot${baseException.itemTitles}"
            : getDefaultText(baseException);
      case ExceptionCode.deleteFileException:
        return "locale.fileDeletionError";
      case ExceptionCode.deleteItemException:
        return "locale.itemDeletionError";
      case ExceptionCode.cameraAccessException:
        return "locale.cameraAccessRequired";
      case ExceptionCode.cannotSaveItemException:
        return "locale.canNotToSaveItem";
      case ExceptionCode.noInternetException:
        return "locale.internetRequired";
      case ExceptionCode.cloudAccessException:
        return "locale.unableCloudConnect";
      case ExceptionCode.noUserException:
        return "locale.userNotFound";
      case ExceptionCode.toMeAccessRemovedException:
        return baseException is ToMeAccessRemovedException
            ? "locale.toMeAccessRemoved${baseException.accessMessage}"
            : getDefaultText(baseException);
      case ExceptionCode.imageCompressInfo:
        return "locale.imageCompressionInfo";
      case ExceptionCode.imageCompressionException:
        return "locale.imageCompressionErrorTryAnotherMode";
      case ExceptionCode.shareToOwnerException:
        return "locale.shareAccessYouAlreadyHave";
      case ExceptionCode.shareToAddedUserException:
        return "locale.shareAccessUserAlreadyAdded";
      case ExceptionCode.premiumProductNotFoundException:
        return "locale.premiumProductNotFound";
      case ExceptionCode.sharingNotAvailableException:
        return "locale.sharedPermissionRequiredDescription";
      case ExceptionCode.cloudFileNotFoundException:
        return "locale.exceptionCloudFolderNotFound";
      case ExceptionCode.unauthorizedCredsException:
        return "locale.exceptionUnauthorizedCreds";
      case ExceptionCode.imgsListIsOverflowException:
        return "locale.exceptionImgsListIsOverflow";
      case ExceptionCode.itemNoParentMoveToRootException:
        return baseException is ItemNoParentMovedToRootException
            ? "locale.exceptionItemNoParentMovedToRoot${baseException.itemTitle}"
            : getDefaultText(baseException);
      case ExceptionCode.invalidCharactersException:
        return "locale.exceptionInvalidCharacters";
      case ExceptionCode.fileChecksumException:
        return "locale.exceptionSyncFileDataChecksum";
      case ExceptionCode.shareToUserMaxCountException:
        return "locale.exceptionShareToUserMaxCount";
      case ExceptionCode.syncFrequencyInfo:
        return "locale.syncFrequencyInfo";
      case ExceptionCode.pdfManyPagesException:
        return "locale.exceptionTooManyTablePages$maxPdfTablePagesForUi";
      case ExceptionCode.updateAppForSyncException:
        return "locale.updateAppToSyncTitle";
      case ExceptionCode.backupReadException:
        return "locale.exceptionBackupRead";
      case ExceptionCode.passwordCharCountException:
        return "locale.exceptionPasswordMoreChars$filePasswCharsMoreThan";
    }
  }

  String getDefaultText(BaseException baseException) {
    return baseException.toString();
  }

  @override
  String localizeSnackbarCode(SnackbarCodeType snackBarMessage) {
    switch (snackBarMessage) {
      case SnackbarCodeType.failedToSync:
        return "locale.failedToSync";
      case SnackbarCodeType.internetRequired:
        return "locale.internetRequired";
      case SnackbarCodeType.waitLittle:
        return "locale.waitLittle";
      case SnackbarCodeType.unableCloudConnect:
        return "locale.unableCloudConnect";
      case SnackbarCodeType.userMustBeAuthorized:
        return "locale.userMustBeAuthorized";
      case SnackbarCodeType.userNotFound:
        return "locale.userNotFound";
      case SnackbarCodeType.successfullyCompleted:
        return "locale.successfullyCompleted";
      case SnackbarCodeType.itemDeletionError:
        return "locale.itemDeletionError";
      case SnackbarCodeType.restoreAuthFailed:
        return "locale.failedRestoreAuthTryAgain";
      case SnackbarCodeType.noScanResult:
        return "locale.noScanResult";
      case SnackbarCodeType.signInFailed:
        return "locale.canNotSignIn";
      case SnackbarCodeType.syncRequired:
        return "${"locale.actionRequiredTitle"}: ${"locale.startSync"}";
    }
  }

  @override
  String getSortTypeTitle(SortType sortType) {
    switch (sortType) {
      case SortType.name:
        return "locale.titleTitle";
      case SortType.created:
        return "locale.sortPanelCreated";
      case SortType.type:
        return "locale.sortPanelType";
      case SortType.modified:
        return "locale.sortPanelModified";
    }
  }

  @override
  String getImageCompressTitle(ImageCompressType compressType) {
    switch (compressType) {
      case ImageCompressType.max:
        return "locale.maximumCompressTitle";
      case ImageCompressType.medium:
        return "locale.mediumCompressTitle";
      case ImageCompressType.min:
        return "locale.minimumCompressTitle";
      default:
        return "locale.unableToDefine";
    }
  }

  @override
  String getExportTypeTitle(ExportFileType exportType) {
    switch (exportType) {
      case ExportFileType.sheet:
        return "locale.exportDataSheetTitle";
      case ExportFileType.text:
        return "locale.exportDataTextTitle";
      case ExportFileType.backup:
        return "locale.exportDataBackupTitle";
    }
  }

  @override
  String getExportFileClmnName(ExportFileColumnType fileClmnType) {
    switch (fileClmnType) {
      case ExportFileColumnType.depthLevel:
        return "locale.locationTitle";
      case ExportFileColumnType.itemType:
        return "locale.sortPanelType";
      case ExportFileColumnType.titleAndDescr:
        return "locale.descriptionTitle";
      case ExportFileColumnType.serialNum:
        return "locale.serialNumberTitle";
      case ExportFileColumnType.itemDate:
        return localeM.unspecifiedDate;
      case ExportFileColumnType.estValue:
        return "locale.estimatedValueTitle";
      case ExportFileColumnType.isFavorite:
        return "locale.favorites";
      case ExportFileColumnType.qrBarcode:
        return "locale.qrOrBarcodeTitle";
    }
  }

  @override
  String getAlertActionTitle(
    ActionAlertTextCode type, {
    required String descriptionAddon,
  }) {
    switch (type) {
      case ActionAlertTextCode.actionRequiredTitle:
        return "locale.actionRequiredTitle";
      case ActionAlertTextCode.syncBlockCloudWasChangedDescription:
        return "${"locale.failedToRestoreUserCloudSyncSession$descriptionAddon}"}"
            "\n${"locale.syncBlockMaySwitchedNewCloud"}"
            " ${"locale.selectAnActionToContinue"}";
      case ActionAlertTextCode.syncBlockEventNotFoundDescription:
        return "${"locale.failedToRestoreUserCloudSyncSession$descriptionAddon}"}"
            " ${"locale.selectAnActionToContinue"}";
      case ActionAlertTextCode.syncBlockDeleteAllLocalDataButton:
        return "locale.syncBlockDeleteAllLocallyBtn";
      case ActionAlertTextCode.syncBlockDeleteAllCloudDataButton:
        return "locale.syncBlockDeleteAllInCloudBtn";
      case ActionAlertTextCode.cancelButton:
        return localeM.cancelButtonLabel;
      case ActionAlertTextCode.sharedPermissionRequiredDescription:
        return "locale.sharedPermissionRequiredDescription";
      case ActionAlertTextCode.continueButton:
        return "locale.btnTitleContinue";
    }
  }

  @override
  String get dividerDot => "locale.dividerDot";
  @override
  String get inventoryTitle => "locale.inventory";

  @override
  String getYmdDateTCheck(DateTime dateTime) {
    return (dateTime != unavailableDate)
        ? HelperFormat.getYmdDateText(code, dateTime)
        : HelperText.dashChar;
  }

  @override
  String nowFullDateTxt() => HelperFormat.getFullDateText(code, DateTime.now());
}
