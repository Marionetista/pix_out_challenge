import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_code_challenge/src/widgets/home/balance_widget.dart';

void main() {
  testWidgets('Verify widget components', (WidgetTester tester) async {
    await _createWidget(tester);

    expect(find.byType(Column), findsOneWidget);

    expect(find.text('Saldo Na Continha'), findsOneWidget);
    expect(find.text('R\$ *********'), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: BalanceWidget(
        title: 'Saldo Na Continha',
      ),
    ),
  );

  await tester.pump();
}
