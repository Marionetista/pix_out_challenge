import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_code_challenge/src/shared/colors/app_colors.dart';
import 'package:pix_code_challenge/src/widgets/home/appbar_widget.dart';

void main() {
  const gradient = [
    AppColors.darkPinky,
    AppColors.pinky,
  ];

  testWidgets('Verify colors from backgorund gradient',
      (WidgetTester tester) async {
    await tester.pumpWidget(const AppBarWidget());

    final background = tester.widget<Container>(find.byType(Container));
    final backgroundDecoration = background.decoration as BoxDecoration;
    final backgroundDecorationGradient =
        backgroundDecoration.gradient as LinearGradient;

    expect(backgroundDecorationGradient.colors, gradient);
  });

  testWidgets('Verify widget height', (WidgetTester tester) async {
    await tester.pumpWidget(const AppBarWidget());

    final background = tester.widget<Container>(find.byType(Container));

    expect(background.constraints?.maxHeight, 200.0);
  });
}
