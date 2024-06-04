import 'package:flutter/material.dart';

import '../../feature_filesystem/widgets/collection_dropdown.dart';
import '../../feature_pdfviewer/widgets/pdf_viewer.dart';
import '../../feature_tags/widgets/tag_dropdown.dart';
import '../../widgets/button_arrow.dart';
import '../../widgets/button_switch.dart';
import '../../widgets/collection_container.dart';
import '../../widgets/collection_tile.dart';
import '../../widgets/dropdown_with_label.dart';
import '../../widgets/navigation_box.dart';
import '../../widgets/navigation_button.dart';
import '../../widgets/search_bar.dart';

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        title: Text('Widgets',
            style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 17)),
        centerTitle: true,
      ),
      body: Scrollbar(
        thumbVisibility: false,
        trackVisibility: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
          const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: DropdownWithLabel(
              dropdown: TagDropdown(tags: <String>{
                "Tag1",
                "Tag2",
                "Tag3",
                "Tag4",
                "Tag5",
                "Tag6",
                "Tag7",
                "Tag8",
                "Tag9",
                "Tag10"
              }),
              label: "Select Tags"),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: DropdownWithLabel(
              dropdown: CollectionDropdown(), label: "Select Folder"),
        ),
        /*Padding(
              padding: const EdgeInsets.all(16),
              child: ScanCarousel(onPageSelect: (final int index) {},),
            ),*/
        CollectionContainer(collectionItems: <CollectionTile>[
          CollectionTile(
              title: 'Folder 1',
              onPressed: () {},
              leading: Icons.folder_outlined,
              trailing: ArrowButton(onPressed: () {})),
          CollectionTile(
              title: 'File 1',
              onPressed: () {},
              leading: Icons.picture_as_pdf_outlined),
          CollectionTile(
            title: 'DarkMode',
            onPressed: () {},
            leading: Icons.dark_mode_outlined,
            trailing: SwitchButton(onChanged: (final bool value) {}),
          ),
        ]),
        const SearchBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (final BuildContext context) =>
                            const PdfViewer(
                                path:
                                'collection1/Immatrikulationsbescheinigung-1.pdf')));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: theme.colorScheme.onSecondary,
                  ),
                  child: const Text('Pdf Viewer')),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,MaterialPageRoute<dynamic>(builder: (final BuildContext context) => {}));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: theme.colorScheme.onSecondary,
                  ),
                  // TODO: Page for this needs to be built
                  child: const Text('Scan Carousel')),
            ),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
        Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(context,MaterialPageRoute<dynamic>(builder: (final BuildContext context) => {}));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.secondary,
            foregroundColor: theme.colorScheme.onSecondary,
          ), child: Text('Dialog X')),
        ),
    ],
    ),
    // const SearchBox(),
    /*NavigationBox(buttons: [
              NavigationButton(buttonText: 'Edit Tags', buttonIcon: Icons.edit_outlined, onPressed: () => showDialog<String>(context: context, builder: (BuildContext context) => const TagDialog())),
              NavigationButton(buttonText: 'Home', buttonIcon: Icons.home_outlined, onPressed: () {}),
              NavigationButton(buttonText: 'Search', buttonIcon: Icons.search_outlined, onPressed: () {}),
            ]),*/
    /*ScanActionButtonContainer(buttons: [
              ScanActionButton(buttonText: 'Rotate', buttonIcon: Icons.rotate_right_outlined, onPressed: () {}),
            ]),*/
    /*ScanActionButtonContainer(buttons: [
              ScanActionButton(buttonText: 'Crop Again', buttonIcon: Icons.crop_free_outlined, onPressed: () {}),
              ScanActionButton(buttonText: 'Retake', buttonIcon: Icons.camera_alt_outlined, onPressed: () {}),
            ]),*/
    ],
    ),
    ),
    ),
    bottomNavigationBar: NavigationBox(
    buttons: <Widget>[
    NavigationButton(
    buttonText: 'Home',
    buttonIcon: Icons.home,
    onPressed: () =>
    Navigator.popUntil(context, ModalRoute.withName('/'))),
    NavigationButton(
    // TODO: Page for camera
    buttonText: 'Scan Document',
    buttonIcon: Icons.camera_alt_outlined,
    onPressed: () {}),
    NavigationButton(
    buttonText: 'Settings',
    buttonIcon: Icons.settings_outlined,
    onPressed: () {})
    ,
    ]
    ,
    )
    ,
    );
  }
}
