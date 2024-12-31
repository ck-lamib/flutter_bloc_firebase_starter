import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  static String date(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  static String dayOfWeek(DateTime date) {
    return DateFormat.E().format(date);
  }
}
