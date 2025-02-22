part of 'platform_factory.dart';

class _DesktopPlatformUiController extends BasicPlatformUiController {
  _DesktopPlatformUiController(super.cloudStatus);

  @override
  double get textFieldContentTopPadding => 6.0;
  @override
  double get textFieldContentBottomPadding => 4.5;
  @override
  double get textFieldBorderVertPadding => paddingSmall;
  @override
  double? get itemDetailsTextHeight => null;
  @override
  double? get itemDateDescriptionHeight => 1.1;
  @override
  double get itemHorizDescrTopPadding => 6.5;
  @override
  double get itemHorizDescrBottomPadding => 2.5;
  @override
  bool isCameraAvailable() => false;
  @override
  Widget getWidgetIfCameraAvalbl(getWidgetFun) => const SizedBox.shrink();
  @override
  List<Widget> getWidgetsIfCameraAvalbl(getListF) => [];

  @override
  Widget getTextDescrWrapper({required Widget descrWidget}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: elementHeightSmall,
      ),
      child: Align(
        alignment: Alignment.center,
        child: descrWidget,
      ),
    );
  }

  @override
  bool get isNeedLifecycleUsing => false;
}
