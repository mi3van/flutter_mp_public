import 'package:intl/intl.dart';
import 'package:my_precious/presentation/config.dart';

abstract class HelperFormat {
  static String getNowFullDateText(String locCode) {
    return getFullDateText(locCode, DateTime.now());
  }

  static String getFullDateText(String locCode, DateTime date) {
    return getYmdDateFormat(locCode).add_jms().format(date);
  }

  static String getYmdDateText(String locCode, DateTime date) {
    return getYmdDateFormat(locCode).format(date);
  }

  static String getMonthText(String locCode, DateTime date) {
    return DateFormat.MMMM(locCode).format(date);
  }

  static String getMonthAndDayText(String locCode, DateTime date) {
    return DateFormat.MMMMd(locCode).format(date);
  }

  static DateFormat getYmdDateFormat(String locCode) {
    return DateFormat.yMd(locCode);
  }

  static String getSimpleDateText(AppLocale locle, String code, DateTime date) {
    final dateNow = DateTime.now();

    final String dayFormatted = date.day == dateNow.day
        ? "locle.syncedDateAddonToday"
        : date.day == dateNow.day - 1
            ? "locle.syncedDateAddonYesterday"
            : getYmdDateFormat(code).format(date);

    final String hourFormatted = DateFormat.jms(code).format(date);
    return "$dayFormatted, $hourFormatted";
  }

  static String getDecmlFrmtd(String locCode, int decimal) {
    return NumberFormat.decimalPattern(locCode).format(decimal);
  }

  static String currency(String locCode, double doubleValue) {
    return NumberFormat.simpleCurrency(locale: locCode).format(doubleValue);
  }

  static String currencySymbol(String locCode) {
    return NumberFormat.simpleCurrency(locale: locCode).currencySymbol;
  }
}
