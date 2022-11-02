import 'package:intl/intl.dart';

class Config {
  //url untuk akses endpoint API

  static String urlApi = "http://172.20.10.2:8000/api/";

  //url untuk akses endpoint API
  static String urlMain = "http://172.20.10.2:8000/";

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
