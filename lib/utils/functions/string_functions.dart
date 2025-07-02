import 'package:intl/intl.dart';

class StringFunctions {
 static String convertDateTimeToTime(DateTime dateTime) {
  // Format the DateTime to 12-hour format (e.g., 3:09 AM)
  String formattedTime = DateFormat('h:mm a').format(dateTime);

  return formattedTime;
}
}