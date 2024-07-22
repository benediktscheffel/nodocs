import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodocs/features/settings/widgets/settings_container.dart';
import 'package:nodocs/features/settings/widgets/settings_tile.dart';

void main() {
  testWidgets('Dialog shows up on button tap',
      (final WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (final BuildContext context) {
              return SettingsContainer(
                collectionItems: <SettingsTile>[
                  SettingsTile(
                    title: 'title',
                    onPressed: () => pressed = true,
                    leading: Icons.language,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );


    await tester.tap(find.byType(SettingsTile));
    await tester.pump();

    expect(pressed, isTrue);
    expect(find.text('title'), findsOneWidget);
    expect(find.byIcon(Icons.language), findsOneWidget);
    expect(find.byType(SettingsTile), findsOneWidget);
  });
}
