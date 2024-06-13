import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/filesystem/widgets/collection_chip_dropdown.dart';

class CollectionDropdown extends StatefulWidget {
  const CollectionDropdown({super.key});

  @override
  State<StatefulWidget> createState() => CollectionDropdownState();
}

class CollectionDropdownState extends State<CollectionDropdown> {
  OverlayEntry? _dropdownOverlay;

  List<Directory> _directories = <Directory>[];
  final String _projectRootAbsolutePath = ConfigParameters.fileSystemPath;
  String _currentAbsolutePath = ConfigParameters.fileSystemPath;
  String _currentRelativePath = '/';


  final LayerLink _layerLink = LayerLink();
  final ScrollController _dropdownScrollController = ScrollController(
    initialScrollOffset: 0,
    keepScrollOffset: true,
  );
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _currentAbsolutePath = ConfigParameters.fileSystemPath;
    _currentRelativePath = '/';
    _listDirectories();
  }

  Future<void> _listDirectories() async {
    final Directory directory = Directory(_currentAbsolutePath);
    final List<Directory> dirs = <Directory>[];

    try {
      final List<FileSystemEntity> entities = directory.listSync();
      for (FileSystemEntity entity in entities) {
        if (entity is Directory) {
          dirs.add(entity);
        }
      }
    } catch (e) {
      print('Error listing directories: $e');
    }

    setState(() {
      _directories = dirs;
    });
  }

  @override
  void dispose() {
    _dropdownScrollController.dispose();
    _horizontalScrollController.dispose();
    _dropdownOverlay?.remove();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_dropdownOverlay == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    final OverlayState overlay = Overlay.of(context);
    _dropdownOverlay = _createDropdownOverlay();
    overlay.insert(_dropdownOverlay!);
  }

  void _removeDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
  }

  void _updateDropdown() {
    _dropdownOverlay?.markNeedsBuild();
  }

  _scrollToRight() {
    _horizontalScrollController.jumpTo(_horizontalScrollController.position.maxScrollExtent);
  }

  OverlayEntry _createDropdownOverlay() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final ThemeData theme = Theme.of(context);

    return OverlayEntry(
      builder: (final BuildContext context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          targetAnchor: Alignment.topLeft,
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Scrollbar(
                  controller: _dropdownScrollController,
                  thumbVisibility: true,
                  child: ListView.builder(
                    controller: _dropdownScrollController,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.zero,
                    itemCount: _directories.isEmpty ? 1 : _directories.length,
                    itemBuilder: (final BuildContext context, final int index) {
                      const double rowHeight = 40;
                      final Directory backDir = Directory(_currentAbsolutePath).parent;
                      final Directory? entryDir = _directories.isNotEmpty ? _directories.elementAt(index) : null;
                      InkWell createDropdownDirectoryEntry() {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _currentAbsolutePath = entryDir.path;
                              _currentRelativePath = '/${_currentAbsolutePath.split(_projectRootAbsolutePath).last}';
                              _listDirectories();
                              _updateDropdown();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            color: theme.colorScheme.tertiaryContainer,
                            height: 40,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    entryDir!.path.split('/').last,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: theme.colorScheme.onTertiaryContainer,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_outlined,
                                  color: theme.colorScheme.onTertiaryContainer,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      InkWell createBackDropdownDirectoryEntry() {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              _currentAbsolutePath = backDir.path;
                              _currentRelativePath = '$_currentAbsolutePath/' == _projectRootAbsolutePath
                                  ? '/'
                                  : '/${_currentAbsolutePath.split(_projectRootAbsolutePath).last}';
                              _listDirectories();
                              _updateDropdown();
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Transform.rotate(
                                angle: 90 * math.pi / 180,
                                child: Icon(
                                  Icons.subdirectory_arrow_left_outlined,
                                  color: theme.colorScheme.onTertiaryContainer,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                                height: rowHeight,
                              ),
                              Text(
                                'Back',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: theme.colorScheme.onTertiaryContainer,
                                ),
                              ),
                            ]
                          ),
                        );
                      }
                      if (_directories.isEmpty && _currentRelativePath != '/') {
                        return createBackDropdownDirectoryEntry();
                      }
                      return Column(
                        children: <Widget>[
                          if (index == 0 && _currentRelativePath != '/')
                            // show BackButton only on top of the first directory
                            createBackDropdownDirectoryEntry(),
                          if (index == 0 && _currentRelativePath != '/')
                            const Divider(thickness: 1.0, height: 0,),
                          if (index != 0)
                            const Divider(thickness: 1.0, height: 0,),
                          createDropdownDirectoryEntry(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((final _) => _scrollToRight());
    final ThemeData theme = Theme.of(context);
    return CompositedTransformTarget(
      link: _layerLink,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  width: 2.0,
                  style: BorderStyle.solid,
                  color: theme.colorScheme.secondary,
                ),
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: _toggleDropdown,
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ListView(
                              controller: _horizontalScrollController,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  CollectionChipDropdown(
                                      pathName: _currentRelativePath),
                                ])
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: theme.colorScheme.onPrimary,
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}