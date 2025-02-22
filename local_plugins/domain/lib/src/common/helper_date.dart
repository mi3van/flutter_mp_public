import 'package:domain/domain.dart';

abstract class HelperDate {
  static int diffNowInMs(DateTime start) {
    return (DateTime.now().millisecondsSinceEpoch -
            start.millisecondsSinceEpoch)
        .abs();
  }

  static int diffNowSecureInMs(DateTime start) {
    return (nowSecure.millisecondsSinceEpoch - start.millisecondsSinceEpoch)
        .abs();
  }

  static DateTime get nowSecure {
    final deviceDate = DateTime.now();
    if (deviceDate.year >= minYearValue) {
      return deviceDate;
    } else {
      return DateTime(
        minYearValue,
        deviceDate.month,
        deviceDate.day,
        deviceDate.hour,
        deviceDate.minute,
        deviceDate.second,
        deviceDate.millisecond,
      );
    }
  }

  static int simpleHashCode(DateTime datetime) {
    return Object.hash(
      datetime.year,
      datetime.month,
      datetime.day,
      datetime.hour,
      datetime.minute,
    );
  }
}
