import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodocs/widgets/button_switch.dart';

void main() {
  testWidgets('SwitchButton calls onChanged when toggled',
      (final WidgetTester tester) async {
    bool wasCalled = false;
    bool? valuePassed;

    void mockOnChanged(final bool value) {
      wasCalled = true;
      valuePassed = value;
    }

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SwitchButton(onChanged: mockOnChanged, value: false),
      ),
    ));

    await tester.tap(find.byType(Switch));
    await tester.pump();

    expect(wasCalled, isTrue);
    expect(valuePassed, isTrue);
  });
}
