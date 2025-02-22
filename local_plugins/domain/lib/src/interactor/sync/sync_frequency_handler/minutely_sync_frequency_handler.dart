import 'dart:async';

import 'package:domain/domain.dart';
import 'package:domain/src/interactor/sync/sync_frequency_handler/base_sync_frequency_handler.dart';

const _halfMinuteDuration = Duration(seconds: 30);

class MinutelySyncFrequencyHandler extends BaseSyncFrequencyHandler {
  @override
  int get diffNeedsForSyncInMs => 0;

  StreamSubscription? subscription;

  @override
  Future<void> onInit() async {
    if (iLocator.authInteractor.isAuth) {
      subscription ??= Stream.periodic(_halfMinuteDuration).listen((_) {
        // iLocator.syncController.periodicSync();
      });
    }
  }

  @override
  void cleanValues() {
    onDispose();
  }

  @override
  void onDispose() {
    if (subscription != null) {
      subscription!.cancel();
      subscription = null;
    }
  }
}
