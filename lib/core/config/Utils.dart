import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'palette.dart';

class MyUtils {
  static formatPrice(num price) => '\$. ${price.toStringAsFixed(2)}';

  static String formatDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  static String firstUpper(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  static String formatDateGuion(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  static bool stringIsnullOrEmpty(String? myString) {
    if (myString == null) {
      return true;
    }
    if (myString.isEmpty) {
      return true;
    }

    return false;
  }

  static String stringIsnull(String? myString) {
    if (myString == null) {
      return '';
    }

    return myString;
  }

  static int calculateDifference(String d) {
    DateTime date = DateTime.parse(d);

    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  //
  //
  static Color statusColor(int status) {
    switch (status) {
      case 1:
        return Palette.statusxconfirmar;
      case 3:
        return Palette.statuscompletada;
      case 4:
        return Palette.statuscancelada;
      case 5:
        return Palette.statusinvoice;
      case 6:
        return Palette.statusReprogramada;
      default:
        return Palette.statusxconfirmar;
    }
  }

  //
  //

  static Future<String> selectDateMethod(
      {TextEditingController? controller,
      required BuildContext context,
      bool before = false}) async {
    DateTime? picked = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),
      // firstDate:  DateTime(2018),
      firstDate: DateTime.now().add(Duration(days: (before) ? -720 : 0)),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );
    if (picked != null) {
      String fechaTemp = DateFormat('yyyy-MM-dd').format(picked);
      controller?.text = fechaTemp;
      // setState(() {});

      return fechaTemp;
    }
    return '';
  }

  static Future<String> selectTimeMethod(
      {TextEditingController? controller,
      required BuildContext context,
      bool before = false}) async {
    TimeOfDay? picked = await showTimePicker(
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
        // return Theme(
        //     data: ThemeData(),
        //     child: MediaQuery(
        //         data: MediaQuery.of(context)
        //             .copyWith(alwaysUse24HourFormat: false),
        //         child: child!));
      },
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      confirmText: 'Ok',
      cancelText: 'Cancelar',
      helpText: 'Seleccionar Horario',
    );
    if (picked != null) {
      String fechaTemp = picked.format(context);
      controller?.text = fechaTemp;
      return fechaTemp;
    }
    return '';
  }
}

//
//

/*


{
  "officeID": 1,
  "serviceID": 1,
  "personID": 1,
  "observation": "",
  "price": 100,
  "date": "2021-12-20",
  "initialTime": "11:00:00",
  "finalTime": "13:00:00",
  "bookingStateID": 1,
  "onlineApp": true,
  "registerUser": 0,
  "client": [
    {
      "userCodeUI": "CB06FC0C7B8B4CB",
      "emailAddress": "pgomez31190@gmail.com",
      "name": "Pedro",
      "surName": "Gomez",
      "secondSurName": "",
      "documentTypeID": 1,
      "identification": "46628055",
      "sexID": "M",
      "bitrhday": "1990-11-03",
      "phoneNumber": "+51993650445"
    }
  ]
}


*/

class MaskedTextInputFormatter extends TextInputFormatter {
  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });
  final String mask;
  final String separator;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
