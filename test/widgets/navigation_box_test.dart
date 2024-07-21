import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodocs/widgets/navigation_box.dart';

void main() {
  testWidgets(
      'NavigationBox has a height of 80', (final WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: NavigationBox(
          buttons: <Widget>[
            Text('Button1'),
          ],
        ),
      ),
    ),
    );
    
    expect(find.byType(NavigationBox), findsOneWidget);
    expect(find.text('Button1'), findsOneWidget);
  });
}