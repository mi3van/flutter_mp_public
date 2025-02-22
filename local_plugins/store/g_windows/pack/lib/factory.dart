// ignore_for_file: depend_on_referenced_packages

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:store_package/desktop_init.dart';
import 'package:store_package/src_auth/api/auth_windows_api.dart';
import 'package:store_package/win_domain_config.dart';

export 'package:basic_google/factory.dart';

abstract class StoreDependFactory {
  static get cloudStatus => CloudStatus.google;

  static void additionalInit() => desktopInit();

  static MarketRepositoryMixin getMarketRepo() => _WindowsStoreRepository();

  static AuthApiMixin getAuthApi() => GoogleWindowsAuthApi();

  static Future<void> checkAppUpdate(BuildContext context) async {}
}

class _WindowsStoreRepository implements MarketRepositoryMixin {
  @override
  String get appDomainForUi => WindowsDomainConfig.appDomain;
  @override
  String get internetCheckAddress => WindowsDomainConfig.fetchAddress;
  @override
  String get appMarketLink => WindowsDomainConfig.appMarketLink;
  @override
  String get subsMarketLink => WindowsDomainConfig.subsMarketLink;
}
