import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

mixin AppAlertModelControllerMixin
    implements AppAlertControllerMixin, AppAlertModelMixin {}

mixin AppAlertModelMixin {
  ValueNotifier<AlertMixin?> get currentAlertNotifier;
  ValueNotifier<SnackbarMixin?> get currentSnackBarNotifier;
  ValueNotifier<BottomSheetMixin?> get currentBtmSheetNotifier;
}
