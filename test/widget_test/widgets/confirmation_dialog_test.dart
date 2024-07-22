import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';

void main() {
  testWidgets('Dialog shows up on button tap',
      (final WidgetTester tester) async {
    // Define the widget that triggers the dialog
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (final BuildContext context) {
            return ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (final BuildContext context) {
                    return ConfirmationDialog(
                        onConfirm: () {},
                        onCancel: () {},
                        header: 'header',
                        notificationText: 'notificationText');
                  },
                );
              },
              child: const Text('Show Dialog'),
            );
          },
        ),
      ),
    ));

    await tester.tap(find.text('Show Dialog'));
    await tester.pump();

    expect(find.byType(ConfirmationDialog), findsOneWidget);
    expect(find.text('header'), findsOneWidget);
    expect(find.text('notificationText'), findsOneWidget);
  });
}
