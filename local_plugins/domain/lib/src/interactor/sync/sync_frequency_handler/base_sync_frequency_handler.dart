import 'package:domain/domain.dart';
import 'package:domain/src/interactor/sync/sync_frequency_handler/daily_sync_frequency_handler.dart';
import 'package:domain/src/interactor/sync/sync_frequency_handler/minutely_sync_frequency_handler.dart';
import 'package:domain/src/interactor/sync/sync_frequency_handler/never_sync_frequency_handler.dart';
import 'package:domain/src/interactor/sync/sync_frequency_handler/weekly_sync_frequency_handler.dart';

abstract class BaseSyncFrequencyHandler implements InitDisposeMixin {
  static BaseSyncFrequencyHandler factory(SyncFrequencyType syncFrequencyType) {
    switch (syncFrequencyType) {
      case SyncFrequencyType.minutely:
        return MinutelySyncFrequencyHandler();
      case SyncFrequencyType.daily:
        return DailySyncFrequencyHandler();
      case SyncFrequencyType.weekly:
        return WeeklySyncFrequencyHandler();
      case SyncFrequencyType.never:
        return NeverSyncFrequencyHandler();
    }
  }

  int get diffNeedsForSyncInMs;

// Need for "never sync" option.
  bool isFrequencySyncAvailable() => true;

// Need for "minute sync" option.
  @override
  Future<void> onInit() async {}

  @override
  void cleanValues() {}

  @override
  void onDispose() {}
}
