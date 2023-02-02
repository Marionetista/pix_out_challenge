import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_code_challenge/src/features/limits/pix_limits_page.dart';
import 'package:pix_code_challenge/src/widgets/limits/date_time_field_widget.dart';

void main() {
  const pageTitle = 'Limites das transações Pix';
  const pageSubtitle =
      'Vocês pode ajustar os limites de transação Pix\ndurante o dia e no período noturno.';
  const noturnoTitle = 'Limites do período diurno';
  const noturnoSubtitle = 'Limite máximo de transação diurna';
  const diurnoTitle = 'Limites do período noturno';
  const diurnoSubtitle = 'Limite máximo de transação noturna';
  const buttonLabel = 'SALVAR';

  testWidgets('Verify widget components', (WidgetTester tester) async {
    await _createWidget(tester);

    expect(find.byType(CustomScrollView), findsOneWidget);
    expect(find.byType(DateTimeFieldsWidget), findsOneWidget);

    expect(find.byType(TextField), findsWidgets);

    expect(find.text('1,000.00'), findsOneWidget);
    expect(find.text('300.00'), findsOneWidget);

    expect(find.text(pageTitle), findsOneWidget);
    expect(find.text(pageSubtitle), findsOneWidget);
    expect(find.text(noturnoTitle), findsOneWidget);
    expect(find.text(noturnoSubtitle), findsOneWidget);
    expect(find.text(diurnoTitle), findsOneWidget);
    expect(find.text(diurnoSubtitle), findsOneWidget);
    expect(find.text(buttonLabel), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Test on button - Find Progress Indicator',
      (WidgetTester tester) async {
    await _createWidget(tester);

    await tester.ensureVisible(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ElevatedButton));

    await tester.pump(const Duration(seconds: 3));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: PixLimitsPage(),
    ),
  );
  await tester.pump();
}
