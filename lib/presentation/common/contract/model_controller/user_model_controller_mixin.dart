import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:my_precious/presentation/common/contract/model_controller/tooltip_controller_mixin.dart';

mixin UserModelControllerMixin
    implements UserControllerMixin, UserModelMixin, InitDisposeMixin {
  TooltipControllerMixin get tooltipController;
}

mixin UserModelMixin implements DataManagerModelMixin {
  ValueNotifier<bool> get isUserLoadingNotifier;
  ValueNotifier<User> get originalUserNotifier;
  ValueNotifier<User?> get selectedUserNotifier;
  bool get isSelUserIsOrig;
  String? get originalUserEmail;
  String get currentUserEmail;
}

mixin DataManagerModelMixin {
  ValueNotifier<bool?> get isFileDownloadedNotifier;
  ValueNotifier<ExportFileType> get exportTypeNotifier;

  TextEditingController get passwImportFieldController;
  TextEditingController get passwExportFieldController;
}
