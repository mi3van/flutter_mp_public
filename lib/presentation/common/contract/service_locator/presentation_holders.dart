import 'package:my_precious/presentation/common/contract/model_controller/app_alert_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/app_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/restoration_ui_controller_model_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/search_item_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/user_model_controller_mixin.dart';

mixin ModelHolderMixin {
  AppModelMixin get appModel;
  AppAlertModelMixin get appAlertModel;
  UserModelMixin get userModel;
  SettingsModelMixin get settingsModel;
  AuthModelMixin get authModel;
  SearchItemModelMixin get searchItemModel;
  RestorationModelMixin get restorationModel;
}
