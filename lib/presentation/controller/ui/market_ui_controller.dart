import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/assets.dart';
import 'package:my_precious/presentation/common/contract/model_controller/ui_controller_mixins.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/service_locator.dart';

AppLocale get _locale => cLocator.localesController.locale;

abstract class _BasicGoogleiUiController implements MarketUiControllerMixin {
  static const _cloudName = 'Google Drive';

  @override
  void cloudNameClick() {
    uiLocator.authController.signInToCloudAndTrySync();
  }

  @override
  String get cloudName => _cloudName;
  @override
  Widget getCloudConnectWidget() => const _GoogleCloudWidget(_cloudName);
  @override
  Widget getCloudIconWidget() => _GoogleCloudIcon();
}

class GoogleiUiController extends _BasicGoogleiUiController {
  @override
  String get storeName => "Google Play";

  @override
  String get subsSwitchDescription =>
      "_locale.premiumPageSwitchSubsAddDescription";
}

class RuStoreUiController extends _BasicGoogleiUiController {
  @override
  String get storeName => "RuStore";
  @override
  String get subsSwitchDescription =>
      "_locale.premiumPageSwitchSubsCancelDescription($storeName)";
}

class _GoogleCloudWidget extends StatelessWidget {
  const _GoogleCloudWidget(this.cloudName);

  final String cloudName;

  @override
  Widget build(BuildContext context) {
    return PreciousTooltip(
      message: "_locale.syncBlockGdriveConnectTooltip",
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _GoogleCloudIcon(),
          const SizedBox(width: paddingMicro),
          Text(cloudName),
        ],
      ),
    );
  }
}

class _GoogleCloudIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.icnGDrive.link,
      width: elementIconSizeMini,
      height: elementIconSizeMini,
      cacheHeight: elementIconSizeRegular.toInt(),
      cacheWidth: elementIconSizeRegular.toInt(),
    );
  }
}

class HuaweiUiController implements MarketUiControllerMixin {
  static const _cloudName = 'Huawei Cloud';

  @override
  void cloudNameClick() {
    // Unimplemented yet
  }

  @override
  String get cloudName => _cloudName;
  @override
  String get storeName => "AppGallery";
  @override
  Widget getCloudConnectWidget() => _HuaweiCloudWidget();
  @override
  Widget getCloudIconWidget() => const SizedBox.shrink();
  @override
  String get subsSwitchDescription =>
      "_locale.premiumPageSwitchSubsAddDescription";
}

class _HuaweiCloudWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = DefaultTextStyle.of(context).style.copyWith(
          color: ThemePalette.secondaryMiddleColor,
        );

    return Text(
      "_locale.notAvailableYet",
      style: textStyle,
    );
    // return const Text(_HuaweiUiController.cloudName);
  }
}
