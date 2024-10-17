import 'package:flutter/services.dart';

import 'currency_text_input_formatter.dart';

class InputFormatters {
  InputFormatters._();

  // static List<TextInputFormatter> onlyTextsNoMoreSpacesAndNumbers = [
  //   InputFormatterOnlyTextsNoMoreSpacesAndNumbers()
  // ];

  // static List<TextInputFormatter> onlyOneSpace = [InputFormatterOnlyOneSpace()];

  // static List<TextInputFormatter> onlyAlfanumericsNoSpaces = [
  //   InputFormatterOnlyAlfanumericNoSpaces()
  // ];

  static List<TextInputFormatter> onlyNumerics = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
  ];

  static List<TextInputFormatter> onlyLettersAndNumerics = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
  ];

  static List<TextInputFormatter> money = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
    CurrencyTextInputFormatter(
      // 9 máximo dígitos incluy endo el punto decimal
      maxDigits: 9,
      maxValue: 1000000,
    ),
  ];
}
