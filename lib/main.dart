import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/boot_status.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/application.dart';
import 'package:my_precious/presentation/flutter_ui/pages/splash_page.dart';
import 'package:my_precious/service_locator.dart' as sl;
import 'package:store_package/factory.dart';

Future<void> main() async {
  BindingBase.debugZoneErrorsAreFatal = true;

  // await runZonedGuarded(() async {
  WidgetsFlutterBinding.ensureInitialized();

  StoreDependFactory.additionalInit();

  sl.initServiceLocator(StoreDependFactory.cloudStatus);
  Domain.init(domainLocator: sl.iLocator);
  Data.init(repositoryLocator: sl.rLocator);

  sl.uiLocator.appController.onInit();
  runApp(
    RootRestorationScope(
      restorationId: rootRestorationId,
      child: FutureBuilder(
        future: sl.uiLocator.appController.necessaryInit,
        builder: (context, snapshot) {
          return sl.uiLocator.appModel.bootStatus.value != BootStatus.booting
              ? Application()
              : MaterialApp(builder: (c, chld) => SplashPage(appInited: false));
        },
      ),
    ),
  );
  // }, (error, stack) {
  //   if (kDebugMode) {
  //     print(error);
  //   }
  //   // Add Error-catch logic or send analytics
  //   exit(1);
  // });
}
