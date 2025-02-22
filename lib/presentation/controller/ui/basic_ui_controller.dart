import 'package:domain/domain.dart';
import 'package:my_precious/presentation/common/contract/model_controller/ui_controller_mixins.dart';

import 'package:my_precious/presentation/controller/ui/market_ui_controller.dart';

abstract class BasicPlatformUiController implements PlatformUiControllerMixin {
  BasicPlatformUiController(CloudStatus cloudStatus) {
    switch (cloudStatus) {
      case CloudStatus.google:
        marketUi = GoogleiUiController();
        break;
      case CloudStatus.huawei:
        marketUi = HuaweiUiController();
        break;
      case CloudStatus.rustore:
        marketUi = RuStoreUiController();
    }
  }
  @override
  late final MarketUiControllerMixin marketUi;
}
