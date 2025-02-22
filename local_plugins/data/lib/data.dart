import 'package:data/src/contract/service_locator/repository_service_locator_mixin.dart';

export 'package:data/src/api/auth/base_auth_api.dart';
export 'package:data/src/api/http_api.dart';
export 'package:data/src/api/isar/user_storage_api.dart';
export 'package:data/src/api/secure_storage_api.dart';
export 'package:data/src/api/share_out_api.dart';
export 'package:data/src/common/const.dart';
export 'package:data/src/common/helper_file.dart';
export 'package:data/src/common/helper_isar_db.dart';
export 'package:data/src/common/helper_pdf_font.dart';
// Need to remove
export 'package:data/src/contract/auth_api_mixin.dart';
export 'package:data/src/contract/auth_required_mixin.dart';
export 'package:data/src/contract/base_storage_api_mixin.dart';
export 'package:data/src/contract/http_api_mixin.dart';
export 'package:data/src/contract/secure_storage_api_mixin.dart';
export 'package:data/src/contract/service_locator/repository_service_locator_mixin.dart';
export 'package:data/src/contract/share_out_api_mixin.dart';
export 'package:data/src/contract/user_api_mixin.dart';
export 'package:data/src/repository/app_repository.dart';
export 'package:data/src/repository/auth_repository.dart';
export 'package:data/src/repository/http_repository.dart';
export 'package:data/src/repository/secure_storage_repository.dart';
export 'package:data/src/repository/share_out_repository.dart';
export 'package:data/src/repository/user_repository.dart';
export 'package:http/http.dart';

late final RepositoryServiceLocatorMixin rLocator;

abstract class Data {
  static init({required RepositoryServiceLocatorMixin repositoryLocator}) {
    rLocator = repositoryLocator;
  }
}
