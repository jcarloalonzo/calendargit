import 'package:intl/intl.dart';

class Config {
  // ============================
  //  URIhttps://api.empeli.com/Store/api/
  // ============================
  static const String urlWebCliente = 'https://api.empeli.com/store/api/';
  // static const String urlLoginClient = 'https://api.empeli.com/Client/api/';
  static const String urlProvider = 'https://api.empeli.com/api/';

  static formatPrice(num price) => '\$. ${price.toStringAsFixed(2)}';

  static String formatDate(DateTime fecha, String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(fecha);
  }

  static bool validarCorreo(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  static final numberFormat = NumberFormat('#,##0', 'en_US');
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
