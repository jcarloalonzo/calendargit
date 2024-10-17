import 'package:flutter/services.dart';

class CurrencyTextInputFormatter extends TextInputFormatter {
  CurrencyTextInputFormatter({required this.maxValue, required this.maxDigits});
  final int maxDigits;
  final int maxValue;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (double.parse(newValue.text) > maxValue) {
      // Se excede el valor máximo permitido, se devuelve el valor anterior
      return oldValue;
    } else {
      // Se aplica el formateo normal
      return newValue.copyWith(
          text: format(newValue.text, maxDigits),
          selection: newValue.selection);
    }
  }

  String format(String input, int maxDigits) {
    // Aplicar cualquier formateo adicional aquí, si es necesario
    return input;
  }
}
