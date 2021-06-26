import 'package:intl/intl.dart';

class Util {
  static String appId = "c9b05e9fec6b5ae28677a84945cc10ca";

  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}