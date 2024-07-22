import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodocs/widgets/navigation_button.dart';

void main() {
  testWidgets('NavigationButton has a height of 80',
      (final WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NavigationButton(
            buttonText: 'Button1',
            buttonIcon: Icons.arrow_back_ios,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byType(NavigationButton), findsOneWidget);
    expect(find.text('Button1'), findsOneWidget);
  });
}
