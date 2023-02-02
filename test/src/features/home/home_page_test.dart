import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_code_challenge/src/features/home/home_page.dart';
import 'package:pix_code_challenge/src/features/limits/pix_limits_page.dart';
import 'package:pix_code_challenge/src/widgets/home/appbar_widget.dart';
import 'package:pix_code_challenge/src/widgets/home/balance_widget.dart';
import 'package:pix_code_challenge/src/widgets/home/main_card_widget.dart';
import 'package:pix_code_challenge/src/widgets/home/options_card_widget.dart';
import 'package:pix_code_challenge/src/widgets/home/sub_card_widget.dart';

void main() {
  const appBarTitle = 'Saldo Disponível';
  const balanceTitle = 'Saldo na conta';
  const balanceOnLittleBoxesTitle = 'Saldo nas caixinhas';

  testWidgets('Verify widget components', (WidgetTester tester) async {
    await _createWidget(tester);

    expect(find.byType(CustomScrollView), findsOneWidget);
    expect(find.byType(AppBarWidget), findsOneWidget);
    expect(find.byType(BalanceWidget), findsNWidgets(2));

    expect(find.byType(MainCardWidget), findsNWidgets(2));
    expect(find.byType(SubCardWidget), findsNWidgets(5));

    expect(find.byType(Stack), findsWidgets);
    expect(find.byType(Icon), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);

    expect(find.byType(OptionsCardWidget), findsNWidgets(3));

    expect(find.text(appBarTitle), findsOneWidget);
    expect(find.text(balanceTitle), findsOneWidget);
    expect(find.text(balanceOnLittleBoxesTitle), findsOneWidget);
  });

  testWidgets('Test navigation', (WidgetTester tester) async {
    await _createWidget(tester);

    await tester.ensureVisible(find.byType(OptionsCardWidget).last);
    await tester.scrollUntilVisible(find.byType(OptionsCardWidget).last, 500.0);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(OptionsCardWidget).last);

    await tester.pumpAndSettle();

    expect(find.byType(PixLimitsPage), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: HomePage(),
    ),
  );
  await tester.pump();
}
