import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/assets.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/boot_status.dart';
import 'package:my_precious/presentation/common/contract/model_controller/app_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/handle_alerts_widget.dart';
import 'package:my_precious/service_locator.dart';

final _backgroundColor = ThemePalette.primaryMiddleColor;
final _iconsColor = ThemePalette.primaryOrig[90];
final _imageSplashCache = elementHeightHuge.toInt() << 1;

class SplashPage extends StatelessWidget {
  const SplashPage({super.key, this.appInited = true});

  final bool appInited;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: HandleAlertsWidget(
        child: Padding(
          padding: const EdgeInsets.all(paddingRegular),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  Assets.imgSnowflake.link,
                  width: elementHeightHuge,
                  height: elementHeightHuge,
                  fit: BoxFit.contain,
                  color: _iconsColor,
                  colorBlendMode: BlendMode.srcIn,
                  cacheHeight: _imageSplashCache,
                  cacheWidth: _imageSplashCache,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: SizedBox(
                  width: elementHeightMicro,
                  height: elementHeightMicro,
                  child: _SplashStatus(appInited),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SplashStatus extends StatelessWidget with GetItMixin {
  _SplashStatus(this._isAppInited);

  final bool _isAppInited;

  @override
  Widget build(BuildContext context) {
    final status = watchX((AppModelControllerMixin model) => model.bootStatus);

    if (status == BootStatus.success) {
      if (_isAppInited) uiLocator.appController.onSuccessAppInit(context);
      return Icon(
        Icons.check_rounded,
        color: _iconsColor,
        size: elementHeightMicro,
      );
    } else if (status == BootStatus.error) {
      return GestureDetector(
        onTap: () {
          _isAppInited ? uiLocator.appController.onAppInitRetry() : null;
        },
        child: Icon(
          Icons.threesixty_rounded,
          color: _iconsColor,
          size: elementHeightMicro,
        ),
      );
    } else if (status == BootStatus.cancel) {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   uiLocator.appAlertController.onShowRestartAppAlert();
      // });

      return Icon(
        Icons.restart_alt_rounded,
        color: _iconsColor,
        size: elementHeightMicro,
      );
    }
    return CircularProgressIndicator(
      strokeWidth: 2,
      color: _iconsColor,
    );
  }
}
