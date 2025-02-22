import 'package:domain/src/common/const.dart';
import 'package:domain/src/interactor/sync/sync_frequency_handler/base_sync_frequency_handler.dart';

class WeeklySyncFrequencyHandler extends BaseSyncFrequencyHandler {
  static const millisecondsPerWeek = Duration.millisecondsPerDay * daysInWeek;

  @override
  int get diffNeedsForSyncInMs => millisecondsPerWeek;
}
