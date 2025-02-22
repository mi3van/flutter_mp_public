import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:my_precious/presentation/common/contract/model_controller/tooltip_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/user_model_controller_mixin.dart';
import 'package:my_precious/presentation/controller/app_controller.dart';
import 'package:my_precious/presentation/controller/tooltip_controller.dart';
import 'package:my_precious/presentation/flutter_ui/common/helper_popup.dart';
import 'package:my_precious/service_locator.dart';

class UserController implements UserModelControllerMixin {
  UserInteractorMixin get _inter => cLocator.userInteractor;

  @override
  final isUserLoadingNotifier = ValueNotifier(false);
  @override
  final originalUserNotifier = ValueNotifier(
      User(userId: 0, dbUserUuid: "", role: Role.defaultLocal, email: ""));
  @override
  final selectedUserNotifier = ValueNotifier(null);
  @override
  String? get originalUserEmail => _inter.originalUserEmail;

  @override
  String get currentUserEmail {
    return (isSelUserIsOrig ? originalUserEmail : _selUserEmail) ?? "";
  }

  String? get _selUserEmail => selectedUserNotifier.value?.email;
  @override
  late TooltipControllerMixin tooltipController;
  // Data management.
  @override
  late final isFileDownloadedNotifier = ValueNotifier(null);
  @override
  late final exportTypeNotifier = ValueNotifier(defaultExportType);

  TextEditingController? _passwImportFieldController;
  TextEditingController? _passwExportFieldController;

  @override
  TextEditingController get passwImportFieldController =>
      _passwImportFieldController ??= TextEditingController();
  @override
  TextEditingController get passwExportFieldController =>
      _passwExportFieldController ??= TextEditingController();

  @override
  Future<void> onInit() async {
    await _inter.onInit();
    originalUserNotifier.value = _inter.originalUser;
    await _initSelectedUserForUi();
    tooltipController = await TootlipFactory.instance();
    setIsOnlyObjExport(false);
  }

  @override
  void cleanValues() {
    selectedUserNotifier.value = null;
    _passwImportFieldController?.clear();
    _passwExportFieldController?.clear();
  }

  @override
  void onDispose() {
    isUserLoadingNotifier.dispose();
    originalUserNotifier.dispose();
    selectedUserNotifier.dispose();
    _passwImportFieldController?.dispose();
    _passwExportFieldController?.dispose();
  }

  @override
  bool get isSelUserIsOrig =>
      _inter.originalUserUuid == _inter.selectedUserUuid;

  @override
  Future<void> setOriginalUserSelected() {
    return _setSharedUserAction(_inter.originalUserUuid);
  }

  Future<bool> _setSharedUserAction(String userUuid) async {
    if (userUuid == _inter.selectedUserUuid) return false;
    if (_isChangingProhibitedWithMessage) return false;

    try {
      isUserLoadingNotifier.value = true;

      await _inter.setAndSaveSelectedUser(userUuid);
      await _initSelectedUserForUi();
      return true;
    } on BaseException catch (e) {
      cLocator.appAlertController.showExceptionAlert(e);
      return false;
    } on Exception catch (e) {
      cLocator.appAlertController.showExceptionMessageAlert(e.toString());
      return false;
    } finally {
      isUserLoadingNotifier.value = false;
    }
  }

  Future<void> _initSelectedUserForUi() async {
    final selectedUser = await _inter.readUser(_inter.selectedUserUuid);
    if (selectedUser != null) {
      selectedUserNotifier.value = selectedUser;
    } else {
      cLocator.appAlertController
          .showSnackBarCode(SnackbarCodeType.userNotFound);
    }
  }

  @override
  Future<List<String>> getAllLocalUserUuids() => _inter.getAllLocalUserUuids();

  @override
  Future<void> setNewLocalUser(String uuid) => _inter.setNewLocalUser(uuid);

  @override
  Future<void> deleteSelectedAllStorageData() async {
    if (_isBigChangingProhibitedWithMessage()) return;
    try {
      showToast(SnackbarCodeType.successfullyCompleted);
    } on BaseException catch (e) {
      cLocator.appAlertController.showExceptionAlert(e);
    } on Exception catch (e) {
      cLocator.appAlertController.showExceptionMessageAlert(e.toString());
    } finally {}
  }

  @override
  Future<void> deleteOriginalAllCloudData() async {
    if (_isBigChangingProhibitedWithMessage()) return;
    try {
      showToast(SnackbarCodeType.successfullyCompleted);
    } finally {}
  }

  @override
  Future<bool> onImportClick() async {
    if (_isBigChangingProhibitedWithMessage()) return false;
    try {
      if (await _inter.importBackupSelUser(passwImportFieldController.text)) {
        showToast(SnackbarCodeType.successfullyCompleted);
        return true;
      }
    } on BaseException catch (e) {
      cLocator.appAlertController.showExceptionAlert(e);
    } on Exception catch (e) {
      cLocator.appAlertController.showExceptionMessageAlert(e.toString());
    } finally {}
    return false;
  }

  @override
  void setNewExportType(ExportFileType newType) => _setpExprtTypAndFun(newType);

  @override
  void setIsOnlyObjExport(bool isOnlyObjExport) {
    isFileDownloadedNotifier.value = false;
  }

  @override
  Future<void> onExportDownlClick() => _onExportClickAction(_downlAllAction);

  @override
  Future<bool> onExportShareClick() => _onExportClickAction(_shareAllAction);

  @override
  Future<void> onOpenDownloadsClick() async {
    if (_isChangingProhibitedWithMessage) return;
    try {
      isUserLoadingNotifier.value = true;
      await cLocator.shareOutInteractor.openDownloadsFolder();
    } on BaseException catch (e) {
      cLocator.appAlertController.showExceptionAlert(e);
    } on Exception catch (e) {
      cLocator.appAlertController.showExceptionMessageAlert(e.toString());
    } finally {
      isFileDownloadedNotifier.value = false;
      isUserLoadingNotifier.value = false;
    }
  }

  Future<bool> _onExportClickAction(Future<bool> Function() actionFun) async {
    if (_isBigChangingProhibitedWithMessage()) return false;
    try {
      return await actionFun();
    } on BaseException catch (e) {
      cLocator.appAlertController.showExceptionAlert(e);
    } on Exception catch (e) {
      cLocator.appAlertController.showExceptionMessageAlert(e.toString());
    } finally {}
    return false;
  }

  Future<bool> _downlAllAction() async {
    isFileDownloadedNotifier.value = await _inter.downloadAll(
      passwExportFieldController.text,
    );
    return isFileDownloadedNotifier.value == true;
  }

  Future<bool> _shareAllAction() =>
      _inter.shareAll(passwExportFieldController.text);

  void _setpExprtTypAndFun(ExportFileType exportType) {
    if (exportType != exportTypeNotifier.value) {
      exportTypeNotifier.value = exportType;
      _inter.exportFileType = exportType;
      isFileDownloadedNotifier.value = false;
    }
  }

  @override
  void cleanAfterImportSheetClose() {
    _passwImportFieldController?.dispose();
    _passwImportFieldController = null;
  }

  @override
  void cleanAfterExportSheetClose() {
    _passwExportFieldController?.dispose();
    _passwExportFieldController = null;
  }

  bool get _isChangingProhibitedWithMessage {
    final isChangingProhibited = isUserLoadingNotifier.value;
    if (isChangingProhibited) {
      HelperPopup.showToastWaitLittle();
    }
    return isChangingProhibited;
  }

  bool _isBigChangingProhibitedWithMessage() {
    final isChangingProhibited = isUserLoadingNotifier.value;

    if (isChangingProhibited) {
      HelperPopup.showToastWaitLittle();
    }
    return isChangingProhibited;
  }
}
