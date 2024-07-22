import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button.dart';

void main() {
  bool pressed = false;
  testWidgets('ScanActionButton ', (final WidgetTester tester) async {
    // Define the widget that triggers the dialog
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (final BuildContext context) {
            return ScanActionButton(
              buttonIcon: Icons.arrow_back_ios,
              buttonText: 'Button1',
              onPressed: () => pressed = true,
            );
          },
        ),
      ),
    ));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(pressed, isTrue);
    expect(find.text('Button1'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
