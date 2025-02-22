import 'package:domain/src/interactor/sync/sync_frequency_handler/base_sync_frequency_handler.dart';

class DailySyncFrequencyHandler extends BaseSyncFrequencyHandler {
  @override
  int get diffNeedsForSyncInMs => Duration.millisecondsPerDay;
}
