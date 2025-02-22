import 'package:domain/src/common/entity/enums/export_file_type.dart';

mixin UserControllerMixin implements DataManagerControllerMixin {
  Future<void> setOriginalUserSelected();
  Future<List<String>> getAllLocalUserUuids();
  Future<void> setNewLocalUser(String uuid);
}

mixin DataManagerControllerMixin {
  Future<bool> onImportClick();
  void setNewExportType(ExportFileType newType);
  void setIsOnlyObjExport(bool isOnlyObjExport);

  Future<bool> onExportShareClick();
  Future<void> onExportDownlClick();
  Future<void> onOpenDownloadsClick();

  Future<void> deleteSelectedAllStorageData();
  Future<void> deleteOriginalAllCloudData();

  void cleanAfterImportSheetClose();
  void cleanAfterExportSheetClose();
}
