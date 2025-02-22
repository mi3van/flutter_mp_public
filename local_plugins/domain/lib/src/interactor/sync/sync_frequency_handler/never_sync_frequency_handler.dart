import 'package:domain/domain.dart';
import 'package:domain/src/interactor/sync/sync_frequency_handler/base_sync_frequency_handler.dart';

class NeverSyncFrequencyHandler extends BaseSyncFrequencyHandler {
  @override
  bool isFrequencySyncAvailable() => false;

  @override
  int get diffNeedsForSyncInMs => maxSafeNativeInt;
}
