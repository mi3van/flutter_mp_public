import 'package:domain/src/common/service_locator/interactor_service_locator_mixin.dart';

export 'package:domain/src/common/const.dart';
export 'package:domain/src/common/crypto/helper_crypto.dart';
export 'package:domain/src/common/debouncer.dart';
export 'package:domain/src/common/domain_mapper/type_converter.dart';
export 'package:domain/src/common/entity/all.dart';
export 'package:domain/src/common/entity/dto/system/btm_sheet_data.dart';
export 'package:domain/src/common/entity/enums/export_file_type.dart';
export 'package:domain/src/common/exception/all.dart';
export 'package:domain/src/common/extension.dart';
export 'package:domain/src/common/helper_date.dart';
export 'package:domain/src/common/helper_format_core.dart';
export 'package:domain/src/common/helper_list.dart';
export 'package:domain/src/common/helper_map.dart';
export 'package:domain/src/common/helper_text.dart';
export 'package:domain/src/common/service_locator/domain_holder_mixins.dart';
export 'package:domain/src/common/service_locator/interactor_service_locator_mixin.dart';
export 'package:domain/src/common/service_locator/locale_locator_mixin.dart';
export 'package:domain/src/contract/api/base_purchase_api_mixin.dart';
export 'package:domain/src/contract/common/alert_mixin.dart';
export 'package:domain/src/contract/common/btm_sheet_mixin.dart';
export 'package:domain/src/contract/common/clone_mixin.dart';
export 'package:domain/src/contract/common/cloud_dto_mixin.dart';
export 'package:domain/src/contract/common/cloud_folders_manager_mixin.dart';
export 'package:domain/src/contract/common/db_dto_mixin.dart';
export 'package:domain/src/contract/common/init_dispose_mixin.dart';
export 'package:domain/src/contract/common/runnable_mixin.dart';
export 'package:domain/src/contract/common/snackbar_mixin.dart';
export 'package:domain/src/contract/controller/app_alert_controller_mixin.dart';
export 'package:domain/src/contract/controller/app_controller_mixin.dart';
export 'package:domain/src/contract/controller/auth_controller_mixin.dart';
export 'package:domain/src/contract/controller/controller_page_mixin.dart';
export 'package:domain/src/contract/controller/locales_controller_mixin.dart';
export 'package:domain/src/contract/controller/navigation_controller_mixin.dart';
export 'package:domain/src/contract/controller/search_item_controller_mixin.dart';
export 'package:domain/src/contract/controller/settings_controller_mixin.dart';
export 'package:domain/src/contract/controller/user_controller_mixin.dart';
export 'package:domain/src/contract/interactor/app_interactor_mixin.dart';
export 'package:domain/src/contract/interactor/auth_interactor_mixin.dart';
export 'package:domain/src/contract/interactor/db_migrate_interactor_mixin.dart';
export 'package:domain/src/contract/interactor/search_item_interactor_mixin.dart';
export 'package:domain/src/contract/interactor/settings_interactor_mixin.dart';
export 'package:domain/src/contract/interactor/share_out_interactor_mixin.dart';
export 'package:domain/src/contract/interactor/user_interactor_mixin.dart';
export 'package:domain/src/contract/repository/app_repository_mixin.dart';
export 'package:domain/src/contract/repository/auth_repository_mixin.dart';
export 'package:domain/src/contract/repository/base_storage_repostitory_mixin.dart';
export 'package:domain/src/contract/repository/http_repository_mixin.dart';
export 'package:domain/src/contract/repository/market_repository_mixin.dart';
export 'package:domain/src/contract/repository/secure_storage_repo_mixin.dart';
export 'package:domain/src/contract/repository/share_out_repository_mixin.dart';
export 'package:domain/src/contract/repository/user_repository_mixin.dart';
export 'package:domain/src/interactor/interactor_factory.dart';

late final InteractorServiceLocatorMixin iLocator;

abstract class Domain {
  static init({required InteractorServiceLocatorMixin domainLocator}) {
    iLocator = domainLocator;
  }
}
