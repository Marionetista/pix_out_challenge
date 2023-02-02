import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_code_challenge/src/widgets/home/main_card_widget.dart';

void main() {
  const title = 'Title';
  const subTitle = 'Subs';

  testWidgets('Verify widget components', (WidgetTester tester) async {
    await _createWidget(
      tester,
      title: title,
      subTitle: subTitle,
    );

    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(InkWell), findsWidgets);
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.byType(RotatedBox), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);

    expect(find.text(title), findsOneWidget);
    expect(find.text(subTitle), findsOneWidget);
  });

  testWidgets('Test tap on widget', (WidgetTester tester) async {
    await _createWidget(
      tester,
      title: title,
      subTitle: subTitle,
    );

    final card = find.byType(Card);
    await tester.tap(card);

    expect(card, findsOneWidget);
  });
}

Future<void> _createWidget(
  WidgetTester tester, {
  required String title,
  required String subTitle,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: MainCardWidget(
        title: title,
        subTitle: subTitle,
        icon: Icons.key,
        titleColor: Colors.black,
        iconColor: Colors.black,
      ),
    ),
  );

  await tester.pump();
}
