import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/boot_status.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/pages.dart';
import 'package:my_precious/presentation/config.dart';

mixin AppModelControllerMixin
    implements
        AppControllerMixin<AppCntxt, AppTheme, AppPalette>,
        AppModelMixin {}

mixin AppModelMixin {
  // ValueNotifier<bool> get isShowAppLoader;
  ValueNotifier<BootStatus?> get bootStatus;
  ValueNotifier<Pages?> get pageAsyncListenerNotifier;
  HolidayUiModeMixin get holidayMode;
}

mixin HolidayUiModeMixin {
  String get mainImgLnk;
}
