import 'package:domain/domain.dart';

mixin SearchItemControllerMixin
    implements ControllerPageMixin, InitDisposeMixin {
  void cleanSearchText();

  Future<void> forceSearch();
}
