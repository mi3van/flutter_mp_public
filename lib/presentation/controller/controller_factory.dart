import 'package:domain/domain.dart';
import 'package:my_precious/presentation/common/contract/model_controller/app_alert_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/app_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/restoration_ui_controller_model_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/search_item_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/ui_controller_mixins.dart';
import 'package:my_precious/presentation/common/contract/model_controller/user_model_controller_mixin.dart';
import 'package:my_precious/presentation/controller/app_alert_controller.dart';
import 'package:my_precious/presentation/controller/app_controller.dart';
import 'package:my_precious/presentation/controller/auth_controller.dart';
import 'package:my_precious/presentation/controller/locales_controller.dart';
import 'package:my_precious/presentation/controller/navigation_controller.dart';
import 'package:my_precious/presentation/controller/restorable_ui_controller.dart';
import 'package:my_precious/presentation/controller/search_item_controller.dart';
import 'package:my_precious/presentation/controller/settings_controller.dart';
import 'package:my_precious/presentation/controller/ui/platform_factory.dart';
import 'package:my_precious/presentation/controller/user_controller.dart';

abstract class ControllerFactory {
  static AppModelControllerMixin get appController => AppController();
  static AppAlertModelControllerMixin get appAlertController =>
      AppAlertController();
  static NavigationControllerMixin get navigationController =>
      NavigationController();
  static LocalesControllerMixin get localesController => LocalesController();
  static SearchItemModelControllerMixin get searchItemController =>
      SearchItemController();
  static UserModelControllerMixin get userController => UserController();
  static SettingsModelControllerMixin get settingsController =>
      SettingsController();
  static AuthModelControllerMixin get authController => AuthController();
  static RestorationUiControllerModelMixin get restorableUiController =>
      RestorableUiController();
  static PlatformUiControllerMixin getPlatformUiController(CloudStatus cldSts) {
    return PlatformFactory.instance.uiController(cldSts);
  }
}
