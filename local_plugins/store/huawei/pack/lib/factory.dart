import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:store_package/hu_domain_config.dart';
import 'package:store_package/src_auth/api/auth_huawei_android_api.dart';
import 'package:store_package/src_auth/app_update.dart';

abstract class StoreDependFactory {
  static get cloudStatus => CloudStatus.huawei;

  static void additionalInit() {}

  static MarketRepositoryMixin getMarketRepo() => _AppGalleryRepository();

  static AuthApiMixin getAuthApi() => HuaweiAndroidAuthApi();

  static Future<void> checkAppUpdate(BuildContext context) =>
      checkForUpdate(context);
}

abstract class StoreDependCloudFactory {}

class _AppGalleryRepository implements MarketRepositoryMixin {
  @override
  String get appDomainForUi => HuaweiDomainConfig.appDomain;
  @override
  String get internetCheckAddress => HuaweiDomainConfig.fetchAddress;
  @override
  String get appMarketLink => HuaweiDomainConfig.appMarketLink;
  @override
  String get subsMarketLink => HuaweiDomainConfig.subsMarketLink;
}
