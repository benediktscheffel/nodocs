import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/filesystem/widgets/collection_chip_dropdown.dart';

class CollectionDropdown extends StatefulWidget {
  final Function(String) openDirectory;
  final Function(String) leaveDirectory;
  final String currentDirectory;
  final List<String> directories;

  const CollectionDropdown({
    super.key,
    required this.openDirectory,
    required this.leaveDirectory,
    required this.currentDirectory,
    required this.directories,
  });

  @override
  State<StatefulWidget> createState() => CollectionDropdownState();
}

class CollectionDropdownState extends State<CollectionDropdown> {
  OverlayEntry? _dropdownOverlay;

  final LayerLink _layerLink = LayerLink();
  final ScrollController _dropdownScrollController = ScrollController(
    initialScrollOffset: 0,
    keepScrollOffset: true,
  );
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
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
    if (_dropdownOverlay != null) {
      _dropdownOverlay?.remove();
      _dropdownOverlay = null;
    }
    _showDropdown();
  }

  _scrollToRight() {
    _horizontalScrollController
        .jumpTo(_horizontalScrollController.position.maxScrollExtent);
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
              height: size.height * 3.7,
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
                    itemCount: widget.directories.isEmpty
                        ? 1
                        : widget.directories.length,
                    itemBuilder: (final BuildContext context, final int index) {
                      double rowHeight = size.height * 0.74;
                      InkWell createDropdownDirectoryEntry() {
                        return InkWell(
                          onTap: () {
                            widget.openDirectory(
                                widget.directories.elementAt(index));
                            setState(() {
                              _updateDropdown();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            color: theme.colorScheme.tertiaryContainer,
                            height: rowHeight,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    _setDisplayName(
                                        widget.directories.elementAt(index)),
                                    style: TextStyle(
                                      fontSize:
                                          theme.textTheme.bodySmall!.fontSize,
                                      color:
                                          theme.colorScheme.onTertiaryContainer,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_outlined,
                                  color: theme.colorScheme.onTertiaryContainer,
                                  size: size.height * 0.37,
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      InkWell createBackDropdownDirectoryEntry() {
                        return InkWell(
                          onTap: () {
                            widget.leaveDirectory(widget.currentDirectory);
                            _updateDropdown();
                          },
                          child: Row(children: <Widget>[
                            Transform.rotate(
                              angle: 90 * math.pi / 180,
                              child: Icon(
                                Icons.subdirectory_arrow_left_outlined,
                                color: theme.colorScheme.onTertiaryContainer,
                              ),
                            ),
                            SizedBox(
                              width: 0.012 * size.width,
                              height: rowHeight,
                            ),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontSize: theme.textTheme.bodySmall!.fontSize,
                                color: theme.colorScheme.onTertiaryContainer,
                              ),
                            ),
                          ]),
                        );
                      }

                      if (widget.directories.isEmpty) {
                        return createBackDropdownDirectoryEntry();
                      }
                      return Column(
                        children: <Widget>[
                          if (index == 0 &&
                              !_isBaseDirectory(widget.currentDirectory))
                            // show BackButton only on top of the first directory
                            createBackDropdownDirectoryEntry(),
                          if (index == 0 &&
                              !_isBaseDirectory(widget.currentDirectory))
                            const Divider(
                              thickness: 1.0,
                              height: 0,
                            ),
                          if (index != 0)
                            const Divider(
                              thickness: 1.0,
                              height: 0,
                            ),
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
    final Size size = MediaQuery.of(context).size;
    final bool landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
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
                        SizedBox(width: size.width * 0.0223),
                        Expanded(
                          child: SizedBox(
                            height: landscape
                                ? size.height * 0.13
                                : size.height * 0.051,
                            child: ListView(
                              controller: _horizontalScrollController,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  CollectionChipDropdown(
                                      pathName: _setDisplayName(
                                          widget.currentDirectory)),
                                ])
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.0223),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: theme.colorScheme.onPrimary,
                        ),
                        SizedBox(width: size.width * 0.0112),
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

  String _setDisplayName(final String path) {
    if (_isBaseDirectory(path)) {
      return "/";
    }
    return path.split("/").last;
  }

  bool _isBaseDirectory(final String path) {
    return path == ConfigParameters.fileSystemPath ||
        "$path/" == ConfigParameters.fileSystemPath;
  }
}
