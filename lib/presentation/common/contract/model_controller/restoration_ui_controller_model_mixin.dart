import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

mixin RestorationUiControllerModelMixin
    implements
        RestorationUiControllerMixin,
        RestorationModelMixin,
        DisposeMixin {}

mixin RestorationUiControllerMixin {
  void restoreState(
      void Function(RestorableProperty<Object?> property, String restorationId)
          registerForRestoration);
}

mixin RestorationModelMixin {
  RestorableStringN get restorableItemUuid;

  RestorableStringN get restorableFavoriteItemUuid;

  RestorableStringN get restorableLuckyItemUuid;

  RestorableString get restorableSearchText;
}
