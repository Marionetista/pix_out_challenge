import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_code_challenge/src/shared/colors/app_colors.dart';
import 'package:pix_code_challenge/src/widgets/home/sub_card_widget.dart';

void main() {
  const title = 'Title';

  testWidgets('Verify widget components', (WidgetTester tester) async {
    await _createWidget(
      tester,
      title: title,
      icon: Icons.abc,
    );

    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(InkWell), findsWidgets);
    expect(find.byType(Icon), findsOneWidget);

    expect(find.text(title), findsOneWidget);
  });

  testWidgets('Test tap on widget', (WidgetTester tester) async {
    await _createWidget(
      tester,
      title: title,
      icon: Icons.abc,
    );

    final card = find.byType(Card);
    await tester.tap(card);

    expect(card, findsOneWidget);
  });
}

Future<void> _createWidget(
  WidgetTester tester, {
  required String title,
  required IconData icon,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: SubCardWidget(
        title: title,
        icon: icon,
        iconColor: AppColors.blacky,
      ),
    ),
  );

  await tester.pump();
}
