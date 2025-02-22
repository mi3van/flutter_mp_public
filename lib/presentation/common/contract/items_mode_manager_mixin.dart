import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

mixin ItemsModeManagerMixin
    implements ItemsModeManagerModelMixin, DisposeMixin {
  void initItemsMode();

  void disposeToSwipeNewItemsMode();

  void saveScrollOffset(String itemUuid);

  void goToScrollOffset(String itemUuid);

  void goToStartScroll();
}

mixin ItemsModeManagerModelMixin {
  ScrollController get mainItemScrollController;

  String? get restorableItemUuid;

  Widget getItemRootInactiveWidget({
    final GestureTapCallback? onClick,
    final GestureTapCallback? onLongPress,
  });

  Widget getItemRootSelectedWidget({
    final GestureTapCallback? onClick,
    final GestureTapCallback? onLongPress,
  });
}
