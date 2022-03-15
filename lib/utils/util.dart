import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class Utils {
  static String dateFormatFromString(String dateString) => Jiffy(dateString, 'dd/MM/yyyy').format("dd MMM yyyy");
  static String dateFormatFromDate(DateTime dateTime) => DateFormat("dd MMM yyyy").format(dateTime);
}