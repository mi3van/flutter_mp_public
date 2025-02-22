import 'dart:async';

import 'package:domain/src/common/const.dart';

class Debouncer {
  final Duration duration;
  Timer? _timer;

  Debouncer({this.duration = regularDebounceDuration});

  run(void Function() action) {
    cancel();
    _timer = Timer(duration, action);
  }

  void cancel() {
    _timer?.cancel();
  }
}
