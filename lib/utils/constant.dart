import 'package:intl/intl.dart';

// Utilities
const String locale = 'id_ID';

extension DateTimeExtension on DateTime {
  String dayName() => DateFormat("E", locale).format(this);
  String simpleDate() => DateFormat("yyyy-MM-dd", locale).format(this);
  String simpleDateRevers() => DateFormat("dd-MM-yyyy", locale).format(this);
  String fullDate() => DateFormat("d MMM yyyy", locale).format(this);
  String fullDateAll() => DateFormat("dd MMMM yyyy", locale).format(this);
  String fullDateTime() =>
      DateFormat("E, d MMM yyyy HH:mm", locale).format(this);
  String dateTime() => DateFormat("yyyy-MM-dd HH:mm:ss", locale).format(this);
  String getTime() => DateFormat('HH:mm', locale).format(this);
  String getTimeSecond() => DateFormat('HH:mm:ss', locale).format(this);
  String getFullTime() => DateFormat('HH:mm a', locale).format(this);
  String getHour() => DateFormat('HH', locale).format(this);
  String getDay() => DateFormat('EEEE', locale).format(this);
  String getTgl() => DateFormat('dd', locale).format(this);
  String getMonth() => DateFormat('MMM', locale).format(this);
  String getMinute() => DateFormat('mm', locale).format(this);
  String getYear() => DateFormat('yyyy', locale).format(this);
  String getMonthAndYear() => DateFormat('MMMM yyyy', locale).format(this);
  String getDayAndDate() =>
      DateFormat('EEEE, MMM dd, yyyy', locale).format(this);
}
