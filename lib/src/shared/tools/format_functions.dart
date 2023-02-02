import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
