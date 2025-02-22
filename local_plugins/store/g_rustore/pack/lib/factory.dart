// ignore_for_file: depend_on_referenced_packages

import 'package:basic_g_android_auth/factory.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:store_package/ru_domain_config.dart';

export 'package:basic_google/factory.dart';

abstract class StoreDependFactory {
  static get cloudStatus => CloudStatus.rustore;

  static void additionalInit() {}

  static MarketRepositoryMixin getMarketRepo() => _RuStoreRepository();

  static AuthApiMixin getAuthApi() => GAuthAndroidFactory.instance;

  static Future<void> checkAppUpdate(BuildContext context) async {}
}

class _RuStoreRepository implements MarketRepositoryMixin {
  @override
  String get appDomainForUi => RustoreDomainConfig.appDomainForUi;
  @override
  String get internetCheckAddress => RustoreDomainConfig.fetchAddress;
  @override
  String get appMarketLink => RustoreDomainConfig.appMarketLink;
  @override
  String get subsMarketLink => RustoreDomainConfig.subsMarketLink;
}
