import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:my_precious/presentation/common/contract/event_handler/alert_event_handler_mixin.dart';
import 'package:my_precious/presentation/event_handler/platform_alert_event_handler/material_alert_event_handler.dart';

class AlertEventHandlerFactory {
  static AlertEventHandlerMixin getAlertEventHandler() {
    if (kIsWeb) {
      return MaterialAlertEventHandler();
    } else if (Platform.isAndroid) {
      return MaterialAlertEventHandler();
    } else {
      return MaterialAlertEventHandler();
    }
  }
}
