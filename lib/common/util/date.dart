import 'package:date_format/date_format.dart';

class DateUtil {
  static String toDate(DateTime dateTime) {
    return formatDate(dateTime, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
  }

  static String toDay(DateTime dateTime) {
    return formatDate(dateTime, [yyyy, '-', mm, '-', dd]);
  }

  static String toTime(DateTime dateTime) {
    return formatDate(dateTime, [HH, ':', nn, ':', ss]);
  }
}
