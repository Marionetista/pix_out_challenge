import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter({
    required this.context,
    this.isTest = false,
  }) : super();

  BuildContext context;
  bool isTest;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newText = newValue.text.replaceAll(RegExp('[^0-9]+'), '');

    if (oldValue.selection.baseOffset < newValue.selection.end &&
        !oldValue.text.isNotEmpty &&
        newValue.selection.end != -1) {
      final index = oldValue.selection.baseOffset;

      final digit = newValue.text[oldValue.selection.baseOffset];

      final newTextWithoutFirstDigit =
          ([...newValue.text.split('')]..removeAt(index)).join('');

      final newNumber = formatStringAsNumber(
            text: '$newTextWithoutFirstDigit$digit',
            context: context,
          ) *
          10;

      newText = formatNumberAsString(
        number: newNumber,
        context: context,
      );

      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    while (newText[0] == '0' && newText.length > 1) {
      newText = newText.substring(1);
    }

    if (newText.isEmpty) {
      newText = '0';
    } else if (newText.length == 1) {
      newText = '00$newText';
    } else if (newText.length == 2) {
      newText = '0$newText';
    }

    if (isTest) {
      newText = formatNumberAsStringForTests(
        number: double.parse(newText) / 100,
      );
    } else {
      newText = formatNumberAsString(
        number: double.parse(newText) / 100,
        context: context,
      );
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  double formatStringAsNumber({
    required String text,
    required BuildContext context,
    String withMask = '#,##0.00',
  }) {
    final locale = getStringLocale(context);
    final formatter = NumberFormat(withMask, locale);

    try {
      final result = formatter.parse(text);

      return result as double;
    } on FormatException {
      return 0.0;
    }
  }

  String formatNumberAsString({
    required double number,
    required BuildContext context,
    String withMask = '#,##0.00',
  }) {
    final locale = getStringLocale(context);
    final formatter = NumberFormat(withMask, locale);

    return formatter.format(number);
  }

  String formatNumberAsStringForTests({
    required double number,
    String locale = 'pt_BR',
    String withMask = '#,##0.00',
  }) {
    final formatter = NumberFormat(withMask, locale);

    return formatter.format(number);
  }

  String localeToUnicode(Locale locale) =>
      '${locale.languageCode}_${locale.countryCode}';

  String getStringLocale(dynamic contextOrLocale) {
    if (contextOrLocale is BuildContext) {
      return localeToUnicode(Localizations.localeOf(contextOrLocale));
    } else if (contextOrLocale is String) {
      return contextOrLocale;
    } else {
      return '';
    }
  }
}
