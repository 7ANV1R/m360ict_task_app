import 'package:intl/intl.dart';

String formatTime(String dateTime) {
  var dateTimeToString = '${dateTime.substring(0, 10)} ${dateTime.substring(11, 23)}';

  DateTime returnDateTime = DateTime.parse(dateTimeToString);

  return DateFormat("hh:mm aaa // EEE, d MMM yyyy").format(returnDateTime); // 2019-04-05 14:00:51.000
}
