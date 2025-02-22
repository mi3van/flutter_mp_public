enum SyncFrequencyType {
  minutely(_minutelyValue),
  daily(_dailyValue),
  weekly(_weeklyValue),
  never(_neverValue);

  const SyncFrequencyType(this.value);
  final int value;

  static SyncFrequencyType fromInt(int value) {
    switch (value) {
      case _minutelyValue:
        return SyncFrequencyType.minutely;
      case _dailyValue:
        return SyncFrequencyType.daily;
      case _weeklyValue:
      case _monthlyValue:
        return SyncFrequencyType.weekly;
      case _neverValue:
        return SyncFrequencyType.never;
      default:
        return SyncFrequencyType.daily;
    }
  }
}

const _minutelyValue = 1;
const _dailyValue = 2;
const _weeklyValue = 3;
const _monthlyValue = 4;
const _neverValue = -1;
