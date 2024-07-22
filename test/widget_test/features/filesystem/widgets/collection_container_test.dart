import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodocs/features/filesystem/widgets/collection_container.dart';
import 'package:nodocs/features/filesystem/widgets/collection_rename_dialog.dart';
import 'package:nodocs/features/filesystem/widgets/collection_tile.dart';
import 'package:nodocs/widgets/collection_tile_dialog.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';

void main() {
  testWidgets('CollectionTile context menu interactions',
      (final WidgetTester tester) async {
    // Mock functions to track calls
    bool shareCalled = false;

    // Define the widget that triggers the context menu
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CollectionContainer(
            children: <CollectionTile>[
              CollectionTile(
                title: 'TestTitle',
                isPdf: true,
                onTapPdf: () {},
                contextMenu: CollectionTileDialog(
                  contextPath: 'testPath',
                  onShare: () => shareCalled = true,
                  onAdd: () {},
                  deleteDialog: ConfirmationDialog(
                    onConfirm: () {},
                    onCancel: () {},
                    header: 'Confirm Delete',
                    notificationText: 'Are you sure you want to delete?',
                  ),
                  renameDialog: CollectionRenameDialog(
                    onSave: (final String s) {},
                    goBack: () {},
                    initialText: 'TestInitialText',
                  ),
                ),
                children: const <CollectionTile>[],
              ),
            ],
          ),
        ),
      ),
    );

    // Simulate a long press to open the context menu
    await tester.longPress(find.text('TestTitle'));
    await tester.pumpAndSettle(); // Wait for the menu to open

    // Tap on the "Share" option and assert it was called
    await tester.tap(find.text('home.collection_tile.share'));
    await tester.pumpAndSettle();

    expect(shareCalled, isTrue);
  });
}
