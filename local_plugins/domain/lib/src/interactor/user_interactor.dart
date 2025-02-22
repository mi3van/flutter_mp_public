import 'package:domain/domain.dart';

class UserInteractor with UserInteractorMixin {
  UserRepositoryMixin get _userRepo => iLocator.userRepository;
  SecureStorageRepositoryMixin get _securRp => iLocator.secureStorageRepository;
  @override
  late String selectedUserUuid;
  @override
  late String originalUserUuid;
  @override
  String? get originalUserEmail => iLocator.authInteractor.signedEmail;
  @override
  User get originalUser => _userRepo.originalUser
    ..email = iLocator.authInteractor.signedEmail ?? ""
    ..nickname = iLocator.authInteractor.signedName ?? "";

  @override
  Future<void> onInit() async {
    // await _secureRepo.deleteAllData();
    String? tempOriginalUuid = await _securRp.readData(
      SecureData.originalUserUuid,
    );
    // Init original user uuid
    if (tempOriginalUuid != null &&
        await _userRepo.readAndSetOriginalUser(tempOriginalUuid)) {
      // Do nothing
    } else {
      List<String> userUuids = await _userRepo.getAllOriginalUserUuids();
      tempOriginalUuid =
          userUuids.isEmpty ? await createUser() : userUuids.first;
      await _securRp.updateData(
        SecureData.originalUserUuid,
        tempOriginalUuid,
      );
      await _userRepo.readAndSetOriginalUser(tempOriginalUuid);
    }
    originalUserUuid = tempOriginalUuid;

    // Init selected user.
    String? tempSelectedUuid = await _securRp.readData(
      SecureData.selectedUserUuid,
    );
    if (tempSelectedUuid != null) {
      selectedUserUuid = tempSelectedUuid;
    } else {
      await setAndSaveSelectedUser(originalUserUuid);
    }
  }

  @override
  Future<String> createUser() {
    return _userRepo.createUser();
  }

  @override
  Future<User?> readUser(String userUuid) {
    return _userRepo.readByUuid(userUuid);
  }

  @override
  Future<User?> readUserOrigCached(String userUuid) async {
    return userUuid == originalUserUuid
        ? originalUser
        : await readUser(userUuid);
  }

  @override
  Future<User?> getUserByEmail(String email) {
    return _userRepo.getUserByEmail(email);
  }

  @override
  Future<List<User>> getUsersPack(List<String> userUuids) {
    return _userRepo.getUsersPack(userUuids);
  }

  @override
  Future<void> updateUser(updatedUser) {
    return _userRepo.updateData(updatedUser);
  }

  @override
  Future<void> setAndSaveSelectedUser(String selectedUserUuid) async {
    await _securRp.updateData(SecureData.selectedUserUuid, selectedUserUuid);
    this.selectedUserUuid = selectedUserUuid;
  }

  @override
  Future<List<String>> getAllLocalUserUuids() =>
      _userRepo.getAllOriginalUserUuids();

  @override
  Future<void> setNewLocalUser(String uuid) async {
    if (iLocator.authInteractor.isAuth) await iLocator.authInteractor.signOut();

    await _securRp.updateData(SecureData.selectedUserUuid, uuid);
  }

  @override
  Future<void> exitUser() {
    throw UnimplementedError();
  }

  late ExportFileType _exportFileType = defaultExportType;

  @override
  set exportFileType(ExportFileType exportFileType) {
    _exportFileType = exportFileType;
  }

  @override
  Future<bool> importBackupSelUser(String filePassword) async {
    return false;
  }

  @override
  Future<bool> shareAll(String filePassword) async {
    return iLocator.shareOutRepository.shareBytes((
      data: await _getExportData(filePassword),
      fileNm: _filename,
      fileExt: _exportFileType.format,
    ));
  }

  @override
  Future<bool?> downloadAll(String filePassword) async {
    return iLocator.shareOutRepository.downlBytes((
      data: await _getExportData(filePassword),
      fileNm: _filename,
      fileExt: _exportFileType.format,
    ));
  }

  Future<List<int>> _getExportData(String filePassword) {
    switch (_exportFileType) {
      case ExportFileType.sheet:
        return _getExcelExportSelUsr();
      case ExportFileType.text:
        return _getTextExportSelUsr();
      case ExportFileType.backup:
        return _getBackupExportSelUsr(filePassword);
    }
  }

  Future<List<int>> _getTextExportSelUsr() async {
    return iLocator.shareOutRepository.convertTextArrayToTextBytes(
      await _getAllItemsArraySelUsrAndEmptyCheck(),
    );
  }

  Future<List<int>> _getExcelExportSelUsr() async {
    return iLocator.shareOutRepository.convertTextArrayToExcelBytes(
      await _getAllItemsArraySelUsrAndEmptyCheck(),
    );
  }

  Future<List<List<String>>> _getAllItemsArraySelUsrAndEmptyCheck() async {
    final result = <List<String>>[
      _clmnsTypeOrder
          .map((clmnType) => "_locale.getExportFileClmnName$clmnType")
          .toList() // Get column titles.
    ];
    return result.length > 1 ? result : throw NoCurrentItemException();
  }

  Future<List<int>> _getBackupExportSelUsr(String filePassword) async {
    return [];
  }

  String get _filename => HelperText.getFilename(
        appInfo: "_locale.inventoryTitle",
        header: "_locale.getExportTypeTitle$_exportFileType",
        formDate: "_locale.nowFullDateTxt",
      );
}

LocalesControllerMixin get _locale => iLocator.localesController;

const _clmnsTypeOrder = [
  ExportFileColumnType.depthLevel,
  ExportFileColumnType.itemType,
  ExportFileColumnType.titleAndDescr,
  ExportFileColumnType.serialNum,
  ExportFileColumnType.itemDate,
  ExportFileColumnType.estValue,
  ExportFileColumnType.isFavorite,
];
