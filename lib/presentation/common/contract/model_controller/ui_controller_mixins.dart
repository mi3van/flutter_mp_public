import 'package:flutter/material.dart';

// Also user as ui's-holder.
mixin PlatformUiControllerMixin {
  double get textFieldContentTopPadding;
  double get textFieldContentBottomPadding;
  double get textFieldBorderVertPadding;
  Widget getTextDescrWrapper({required Widget descrWidget});
  double? get itemDetailsTextHeight;
  double? get itemDateDescriptionHeight;
  double get itemHorizDescrTopPadding;
  double get itemHorizDescrBottomPadding;

  bool isCameraAvailable();
  Widget getWidgetIfCameraAvalbl(Widget Function() getWidgetFun);
  List<Widget> getWidgetsIfCameraAvalbl(List<Widget> Function() getListF);

  bool get isNeedLifecycleUsing;

  MarketUiControllerMixin get marketUi;
}

mixin MarketUiControllerMixin {
  String get cloudName;
  String get storeName;

  Widget getCloudIconWidget();

  Widget getCloudConnectWidget();

  void cloudNameClick();

  String get subsSwitchDescription;
}
