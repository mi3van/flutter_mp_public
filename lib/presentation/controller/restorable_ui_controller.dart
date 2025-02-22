import 'package:flutter/widgets.dart';
import 'package:my_precious/presentation/common/contract/model_controller/restoration_ui_controller_model_mixin.dart';

class RestorableUiController implements RestorationUiControllerModelMixin {
  @override
  final RestorableStringN restorableItemUuid = RestorableStringN(null);
  @override
  final RestorableStringN restorableFavoriteItemUuid = RestorableStringN(null);
  @override
  final RestorableStringN restorableLuckyItemUuid = RestorableStringN(null);
  @override
  final RestorableString restorableSearchText = RestorableString('');

  @override
  void restoreState(
      void Function(RestorableProperty<Object?> property, String restorationId)
          registerForRestoration) {
    registerForRestoration(restorableItemUuid, "restorableItemUuid");
    registerForRestoration(
      restorableFavoriteItemUuid,
      "restorableFavoriteItemUuid",
    );
    registerForRestoration(restorableLuckyItemUuid, "restorableLuckyItemUuid");
    registerForRestoration(restorableSearchText, "restorableSearchText");
  }

  @override
  void cleanValues() {
    restorableItemUuid.value = null;
    restorableFavoriteItemUuid.value = null;
    restorableLuckyItemUuid.value = null;
    restorableSearchText.value = '';
  }

  @override
  void onDispose() {
    restorableItemUuid.dispose();
    restorableFavoriteItemUuid.dispose();
    restorableLuckyItemUuid.dispose();
    restorableSearchText.dispose();
  }
}
