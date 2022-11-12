import 'package:intl/intl.dart';

class Config {
  //url untuk akses endpoint API
  static String urlApi = "http://www.rickylaptopstore.my.id/api/";

  //url untuk akses endpoint API
  static String urlMain = "http://www.rickylaptopstore.my.id/";

  //format idr
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currentFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR. ',
      decimalDigits: decimalDigit,
    );

    return currentFormatter.format(number);
  }
}
