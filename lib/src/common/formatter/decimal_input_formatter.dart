import 'package:flutter/services.dart';

class DecimalInputFormatter extends TextInputFormatter {
  DecimalInputFormatter({
    required this.decimal,
    this.max,
  }) : assert(decimal > 0);

  final int decimal;
  final double? max;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String value = newValue.text.replaceAll(',', '.');

    final regex = RegExp(r'^\d+\.?\d{0,' + decimal.toString() + r'}$');
    if (value.isNotEmpty && !regex.hasMatch(value)) {
      value = oldValue.text;
    }

    if (max != null && regex.hasMatch(value) && double.parse(value) > max!) {
      value = max.toString();
    }

    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(
        offset: value.isEmpty ? 0 : value.length,
      ),
    );
  }
}
