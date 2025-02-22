import 'package:domain/domain.dart';
import 'package:my_precious/presentation/common/contract/event_handler/alert_event_handler_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/restoration_ui_controller_model_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/ui_controller_mixins.dart';
import 'package:my_precious/presentation/common/contract/service_locator/presentation_holders.dart';

mixin UiServiceLocatorMixin<C, L, M, T, P>
    on
        ControllerHolderMixin<C, L, M, T, P>,
        ModelHolderMixin,
        CommonLocatorMixin {
  AlertEventHandlerMixin get alertEventHandler;
  NavigationControllerMixin<C> get navigationController;
  PlatformUiControllerMixin get platformUiController;
  RestorationUiControllerMixin get restorationUiController;
}
