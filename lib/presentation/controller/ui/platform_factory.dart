import 'dart:io' show Platform;

import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/model_controller/ui_controller_mixins.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/controller/ui/basic_ui_controller.dart';

part 'desktop_ui_controller.dart';
part 'mobile_ui_controller.dart';

abstract class PlatformFactory {
  static PlatformMixin? _inst;
  static PlatformMixin get instance =>
      _inst ??= kIsWeb || (!Platform.isAndroid && !Platform.isIOS)
          ? _DesktopPlatform()
          : _MobilePlatform();
}

class _MobilePlatform implements PlatformMixin {
  @override
  PlatformUiControllerMixin uiController(cloudStatus) {
    return _MobilePlatformUiController(cloudStatus);
  }
}

class _DesktopPlatform implements PlatformMixin {
  @override
  PlatformUiControllerMixin uiController(cloudStatus) {
    return _DesktopPlatformUiController(cloudStatus);
  }
}

mixin PlatformMixin {
  PlatformUiControllerMixin uiController(CloudStatus cloudStatus);
}
