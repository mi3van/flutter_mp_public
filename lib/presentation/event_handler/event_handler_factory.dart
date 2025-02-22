import 'package:my_precious/presentation/common/contract/event_handler/alert_event_handler_mixin.dart';
import 'package:my_precious/presentation/event_handler/platform_alert_event_handler/alert_event_handler_factory.dart';

abstract class EventHandlerFactory {
  static AlertEventHandlerMixin get alertEventHandler =>
      AlertEventHandlerFactory.getAlertEventHandler();
}
