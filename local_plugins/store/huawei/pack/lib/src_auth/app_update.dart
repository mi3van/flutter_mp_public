import 'package:flutter/widgets.dart';
import 'package:huawei_in_app_update/huawei_in_app_update.dart';

Future<void> checkForUpdate(BuildContext context) async {
  if ((await HuaweiInAppUpdate.checkForUpdate()).updateAvailable) {
    HuaweiInAppUpdate.showUpdateDialog(
      // ignore: use_build_context_synchronously
      context: context,
      force: false,
    );
  }
}
