import 'package:domain/domain.dart';
import 'package:my_precious/presentation/common/contract/model_controller/tooltip_controller_mixin.dart';
import 'package:my_precious/service_locator.dart';

enum _Tooltips {
  addNewItem(1),
  ;

  final int value;

  const _Tooltips(this.value);
}

abstract class TootlipFactory {
  static Future<TooltipControllerMixin> instance() async {
    return await cLocator.settingsInteractor.getTooltipsWathed() !=
            _Tooltips.addNewItem.value
        ? TooltipController()
        : EmptyTooltipController();
  }
}

class TooltipController implements TooltipControllerMixin {
  SettingsInteractorMixin get _settInter => cLocator.settingsInteractor;

  @override
  Future<void> tryAddNewItemTooltip(tooltipController) async {
    final tValue = await _settInter.getTooltipsWathed();
    if (tValue != _Tooltips.addNewItem.value) {
      await tooltipController.showTooltip();
      await _settInter.updateTooltipsWathed(_Tooltips.addNewItem.value);
    }
  }
}

class EmptyTooltipController implements TooltipControllerMixin {
  @override
  Future<void> tryAddNewItemTooltip(tooltipController) async {}
}
