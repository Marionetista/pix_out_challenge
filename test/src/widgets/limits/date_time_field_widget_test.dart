import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_code_challenge/src/widgets/limits/date_time_field_widget.dart';

void main() {
  testWidgets('Verify widget components', (WidgetTester tester) async {
    await _createWidget(tester);

    expect(find.byType(Expanded), findsWidgets);
    expect(find.byType(DateTimeField), findsWidgets);

    expect(find.text('Horário Noturno'), findsOneWidget);
  });

  testWidgets('Verify tap and showTimePicker on first field',
      (WidgetTester tester) async {
    await _createWidget(tester);

    final field = find.byType(DateTimeField).first;
    await tester.tap(field);
    await tester.pump();

    expect(find.byType(TimePickerDialog), findsOneWidget);
  });

  testWidgets('Verify tap and showTimePicker on second field',
      (WidgetTester tester) async {
    await _createWidget(tester);

    final field = find.byType(DateTimeField).last;
    await tester.tap(field);
    await tester.pump();

    expect(find.byType(TimePickerDialog), findsOneWidget);
    expect(find.byType(TimePickerDialog), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: Scaffold(body: DateTimeFieldsWidget()),
    ),
  );

  await tester.pump();
}
