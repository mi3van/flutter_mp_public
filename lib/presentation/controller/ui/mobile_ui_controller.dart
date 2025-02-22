part of 'platform_factory.dart';

class _MobilePlatformUiController extends BasicPlatformUiController {
  _MobilePlatformUiController(super.cloudStatus);

  @override
  double get textFieldContentTopPadding => paddingSmaller;
  @override
  double get textFieldContentBottomPadding => 1.0;
  @override
  double get textFieldBorderVertPadding => paddingSmaller;
  @override
  double? get itemDetailsTextHeight => 1.2;
  @override
  double? get itemDateDescriptionHeight => null;
  @override
  double get itemHorizDescrTopPadding => paddingMicro;
  @override
  double get itemHorizDescrBottomPadding => 1.0;
  @override
  bool isCameraAvailable() => true;
  @override
  Widget getWidgetIfCameraAvalbl(getWidgetFun) => getWidgetFun();
  @override
  List<Widget> getWidgetsIfCameraAvalbl(getListF) => getListF();

  @override
  Widget getTextDescrWrapper({required Widget descrWidget}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: textFieldContentBottomPadding,
      ),
      child: descrWidget,
    );
  }

  @override
  bool get isNeedLifecycleUsing => true;
}
