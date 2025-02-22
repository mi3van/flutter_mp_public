// ignore_for_file: depend_on_referenced_packages

import 'package:basic_g_android_auth/factory.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:store_package/go_domain_config.dart';

export 'package:basic_google/factory.dart';

abstract class StoreDependFactory {
  static CloudStatus get cloudStatus => CloudStatus.google;

  static void additionalInit() {}

  static MarketRepositoryMixin getMarketRepo() => _GooglePlayRepository();

  static AuthApiMixin getAuthApi() => GAuthAndroidFactory.instance;

  static Future<void> checkAppUpdate(BuildContext context) async {}
}

class _GooglePlayRepository implements MarketRepositoryMixin {
  @override
  String get appDomainForUi => GoogleDomainConfig.appDomain;
  @override
  String get internetCheckAddress => GoogleDomainConfig.fetchAddress;
  @override
  String get appMarketLink => GoogleDomainConfig.appMarketLink;
  @override
  String get subsMarketLink => GoogleDomainConfig.subsMarketLink;
}
