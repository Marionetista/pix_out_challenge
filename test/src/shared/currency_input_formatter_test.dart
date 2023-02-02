import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pix_code_challenge/src/shared/tools/currency_input_formatter.dart';
import 'package:pix_code_challenge/src/shared/tools/format_functions.dart';

class MockBuildContext extends Mock implements BuildContext {}

CurrencyInputFormatter? _currencyInputFormatter;

void main() {
  MockBuildContext mockContext;

  setUp(() {
    mockContext = MockBuildContext();
    _currencyInputFormatter =
        CurrencyInputFormatter(context: mockContext, isTest: true);
  });

  testWidgets('Test input 1 cent', (tester) async {
    const oldValue = TextEditingValue.empty;
    const newValue = TextEditingValue(text: '1');
    final result =
        _currencyInputFormatter?.formatEditUpdate(oldValue, newValue);
    final expectedResult = formatNumberAsStringForTests(number: 0.01);

    expect(result?.text, expectedResult);
  });

  testWidgets('Test input 10 cents', (tester) async {
    const oldValue = TextEditingValue.empty;
    const newValue = TextEditingValue(text: '10');
    final result =
        _currencyInputFormatter?.formatEditUpdate(oldValue, newValue);
    final expectedResult = formatNumberAsStringForTests(number: 0.10);

    expect(result?.text, expectedResult);
  });

  testWidgets('Test input 1,00 real', (tester) async {
    const oldValue = TextEditingValue.empty;
    const newValue = TextEditingValue(text: '100');
    final result =
        _currencyInputFormatter?.formatEditUpdate(oldValue, newValue);
    final expectedResult = formatNumberAsStringForTests(number: 1.00);

    expect(result?.text, expectedResult);
  });

  testWidgets('Test input 1,00 real and delete one number', (tester) async {
    const oldValue = TextEditingValue(text: '1,00');
    const newValue = TextEditingValue(text: '1,0');
    final result =
        _currencyInputFormatter?.formatEditUpdate(oldValue, newValue);
    final expectedResult = formatNumberAsStringForTests(number: 0.10);

    expect(result?.text, expectedResult);
  });

  testWidgets('Test input 1,00 real and delete two numbers', (tester) async {
    const oldValue = TextEditingValue(text: '1,00');
    const newValue = TextEditingValue(text: '1,');
    final result =
        _currencyInputFormatter?.formatEditUpdate(oldValue, newValue);
    final expectedResult = formatNumberAsStringForTests(number: 0.01);

    expect(result?.text, expectedResult);
  });

  testWidgets('Test input 1.000,00 reals', (tester) async {
    const oldValue = TextEditingValue(text: '100,00');
    const newValue = TextEditingValue(text: '100,000');
    final result =
        _currencyInputFormatter?.formatEditUpdate(oldValue, newValue);
    final expectedResult = formatNumberAsStringForTests(number: 1000.00);

    expect(result?.text, expectedResult);
  });

  testWidgets('Test input 152,34 reals and delete 5 ', (tester) async {
    final oldValue = TextEditingValue(
      text: formatNumberAsStringForTests(number: 15.234),
      selection: const TextSelection(baseOffset: 6, extentOffset: 6),
    );
    final newValue = TextEditingValue(
      text: formatNumberAsStringForTests(number: 12.34),
      selection: const TextSelection(baseOffset: 5, extentOffset: 5),
    );

    final result =
        _currencyInputFormatter?.formatEditUpdate(oldValue, newValue);
    final expectedResult = formatNumberAsStringForTests(
      number: 12.34,
    );

    expect(result?.text, expectedResult);
  });
}
