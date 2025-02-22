import 'dart:async';

mixin InitDisposeMixin implements InitsAsyncMixin, DisposeMixin {}

mixin InitsAsyncMixin {
  Future<void> onInit();
}

mixin DisposeMixin {
  void cleanValues();
  void onDispose();
}

mixin LifecycleMixin {
  void onResume();
  void onPause();
}
