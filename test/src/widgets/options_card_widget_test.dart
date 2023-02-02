import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_code_challenge/src/widgets/home/options_card_widget.dart';

void main() {
  const title = 'Title';

  testWidgets('Verify widget components', (WidgetTester tester) async {
    await _createWidget(
      tester,
      title: title,
    );

    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(InkWell), findsWidgets);
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);

    expect(find.text(title), findsOneWidget);
  });

  testWidgets('Test tap on widget', (WidgetTester tester) async {
    await _createWidget(
      tester,
      title: title,
    );

    final card = find.byType(Card);
    await tester.tap(card);

    expect(card, findsOneWidget);
  });
}

Future<void> _createWidget(
  WidgetTester tester, {
  required String title,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: OptionsCardWidget(
        title: title,
        onTap: () {},
      ),
    ),
  );

  await tester.pump();
}
