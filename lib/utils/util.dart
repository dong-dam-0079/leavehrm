import 'package:jiffy/jiffy.dart';

class Utils {
  static String dateFormat(String date) => Jiffy(date, 'dd/MM/yyyy').format("dd MMM yyyy");
}