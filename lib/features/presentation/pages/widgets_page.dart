import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:nodocs/features/filesystem/widgets/collection_container.dart';
import 'package:nodocs/features/filesystem/widgets/collection_create_dialog.dart';
import 'package:nodocs/features/filesystem/widgets/collection_dropdown.dart';
import 'package:nodocs/features/presentation/pages/widgets_input_title_page.dart';
import 'package:nodocs/features/presentation/pages/widgets_title_with_button_page.dart';

import 'package:nodocs/features/scan/widgets/scan_action_button.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button_container.dart';
import 'package:nodocs/features/scan/widgets/scan_camera.dart';
import 'package:nodocs/features/scan/widgets/scan_carousel.dart';
import 'package:nodocs/features/scan/widgets/scan_crop.dart';
import 'package:nodocs/features/settings/widgets/settings_container.dart';
import 'package:nodocs/features/settings/widgets/settings_tile.dart';

import 'package:nodocs/features/tags/widgets/tag_dialog.dart';
import 'package:nodocs/features/tags/widgets/tag_dropdown.dart';
import 'package:nodocs/widgets/button_switch.dart';

import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/title_with_button.dart';
import 'package:nodocs/widgets/dropdown_with_label.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';
import 'package:nodocs/widgets/search_bar.dart';




class WidgetsPage extends StatelessWidget {
  final List<CameraDescription> cameras;
  const WidgetsPage({super.key, required this.cameras});

  Widget _sectionHeader(final ThemeData theme, final String headline) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            headline,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          Divider(
            thickness: 2,
            color: theme.colorScheme.secondary,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        title: TitleWithButton(title: 'Widgets', icon: Icons.arrow_back_ios, onButtonClick: () => Navigator.popUntil(context, ModalRoute.withName('/'))),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                _sectionHeader(theme, 'Our Dropdown Widgets'),
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
                    dropdown: CollectionDropdown(),
                    label: "Select Folder",
                  ),
                ),
                _sectionHeader(theme, 'Our Carousel Widget'),
                ScanCarousel(onPageSelect: (final int index) {},),
                _sectionHeader(theme, 'Our Menu Widgets'),
                /*SettingsContainer(collectionItems: <SettingsTile>[
                          SettingsTile(
                            title: 'DarkMode',
                            onPressed: () {},
                            leading: Icons.dark_mode_outlined,
                            trailing: SwitchButton(onChanged: (final bool value) {}),
                          ),
                        ]),*/
                const CollectionContainer(),
                _sectionHeader(theme, 'Our Searchbar Widget'),
                const SearchBox(),
                _sectionHeader(theme, 'Our Dialog Widgets'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (final BuildContext context) =>
                            const CollectionCreateDialog()
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary,
                          foregroundColor: theme.colorScheme.onSecondary,
                        ),
                        child: const Text('New Collection')
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (final BuildContext context) =>
                          const TagDialog(),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary,
                          foregroundColor: theme.colorScheme.onSecondary,
                        ),
                        child: const Text('Edit Tags')
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (final BuildContext context) =>
                            ConfirmationDialog(
                              onConfirm: (){},
                              onCancel: (){},
                              header: 'Discard this scan?',
                              notificationText: 'Are you sure you want to discard this scan without saving? This will discard all pages of this scan.'
                            ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary,
                          foregroundColor: theme.colorScheme.onSecondary,
                        ),
                        child: const Text('Discard Scan')
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (final BuildContext context) =>
                          ConfirmationDialog(
                            onConfirm: (){},
                            onCancel: (){},
                            header: 'Retake this scan?',
                            notificationText: 'Are you sure you want to retake the scan of the current page without saving?',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary,
                          foregroundColor: theme.colorScheme.onSecondary,
                        ),
                        child: const Text('Retake Scan')
                      ),
                    ),
                  ],
                ),
                _sectionHeader(theme, 'Our Navigation Widgets'),
                NavigationBox(buttons: <Widget>[
                  NavigationButton(buttonText: 'Edit Tags', buttonIcon: Icons.edit_outlined, onPressed: () {}),
                  NavigationButton(buttonText: 'Home', buttonIcon: Icons.home_outlined, onPressed: () {}),
                  NavigationButton(buttonText: 'Search', buttonIcon: Icons.search_outlined, onPressed: () {}),
                ]),
                const SizedBox(height: 5,),
                NavigationBox(buttons: <Widget>[
                  NavigationButton(buttonText: 'New Collection', buttonIcon: Icons.add_outlined, onPressed: () {}),
                  NavigationButton(buttonText: 'Scan Document', buttonIcon: Icons.camera_alt_outlined, onPressed: () {}),
                  NavigationButton(buttonText: 'Settings', buttonIcon: Icons.settings_outlined, onPressed: () {}),
                ]),
                const SizedBox(height: 5,),
                NavigationBox(buttons: <Widget>[
                  NavigationButton(buttonText: 'Retake Photo', buttonIcon: Icons.flip_camera_ios_outlined, onPressed: () {}),
                  NavigationButton(buttonText: 'Keep Scanning', buttonIcon: Icons.arrow_forward_outlined, onPressed: () {}),
                  NavigationButton(buttonText: 'Save Document', buttonIcon: Icons.save_outlined, onPressed: () {}),
                ]),
                const SizedBox(height: 5,),
                NavigationBox(buttons: <Widget>[
                  NavigationButton(buttonText: 'Cancel', buttonIcon: Icons.cancel_outlined, onPressed: () {}),
                  NavigationButton(buttonText: 'Save & Exit', buttonIcon: Icons.save_outlined, onPressed: () {}),
                ]),
                _sectionHeader(theme, 'Our ActionButton Widgets'),
                ScanActionButton(buttonIcon: Icons.crop_outlined, buttonText: 'Crop', onPressed: () {},),
                const SizedBox(height: 5,),
                ScanActionButtonContainer(buttons: <Widget>[
                  ScanActionButton(buttonIcon: Icons.crop_free_outlined, buttonText: 'Crop Again', onPressed: () {},),
                  ScanActionButton(buttonIcon: Icons.flip_camera_ios_outlined, buttonText: 'Retake', onPressed: () {},),
                ]),
                _sectionHeader(theme, 'Our Editable Title Widget'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (final BuildContext context) =>
                              const WidgetsInputTitlePage()
                      )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: theme.colorScheme.onSecondary,
                  ),
                  child: const Text('Input Title Page')
                ),
                _sectionHeader(theme, 'Our Title with Button Widgets'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (final BuildContext context) =>
                        const WidgetsTitleWithButtonPage(
                          icon: Icons.home_outlined,
                          title: 'Crop Scan',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: theme.colorScheme.onSecondary,
                  ),
                  child: const Text('Button with Crop Scan Title Page')
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (final BuildContext context) =>
                        const WidgetsTitleWithButtonPage(
                          icon: Icons.arrow_back_ios,
                          title: 'Settings',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: theme.colorScheme.onSecondary,
                  ),
                  child: const Text('Button with Settings Title Page')
                ),
                _sectionHeader(theme, 'Our Camera Widget'),
                SizedBox(
                  height: 700,
                  child: ScanCamera(cameras: cameras,),
                ),
                _sectionHeader(theme, 'Our Crop Widget'),
              ],
            ),
          ),
          const ScanCrop(path: '/data/data/com.example.nodocs/files/Collection1/annie-spratt-_dAnK9GJvdY-unsplash.jpg',),
          _sectionHeader(theme, 'Our Settings Widget'),

          SettingsContainer(collectionItems: <SettingsTile>[
            SettingsTile(
              title: 'Run text recognition',
              onPressed: () {},
              leading: Icons.document_scanner_outlined,
              trailing: SwitchButton(onChanged: (final bool value) {}),
            ),
            SettingsTile(
                title: 'Text recognition language', onPressed: (){},
                leading: Icons.language_outlined,
                trailing: Icon(Icons.arrow_right, color: theme.colorScheme.onSecondary)),
          ]),
          SettingsContainer(collectionItems: <SettingsTile>[
            SettingsTile(
              title: 'Dark Mode',
              onPressed: () {},
              leading: Icons.dark_mode_outlined,
              trailing: SwitchButton(onChanged: (final bool value) {}),
            ),
            SettingsTile(
                title: 'Text size',
                onPressed: (){},
                leading: Icons.text_fields_outlined,
                trailing: Icon(Icons.arrow_right, color: theme.colorScheme.onSecondary)),
          ]),
      ],
    ),
    /*bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
              buttonText: 'Home',
              buttonIcon: Icons.home_outlined,
              onPressed: () =>
                  Navigator.popUntil(context, ModalRoute.withName('/'))),
        ],
      ),*/
    );
  }
}
