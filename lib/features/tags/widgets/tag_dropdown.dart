import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nodocs/features/tags/widgets/tag_chip_dropdown.dart';

class TagDropdown extends StatefulWidget {
  final List<String> tags;
  final ValueChanged<String> onSelectionChange;

  const TagDropdown({super.key, required this.tags, required this.onSelectionChange});

  @override
  State<StatefulWidget> createState() => TagDropdownState();
}

class TagDropdownState extends State<TagDropdown> {
  OverlayEntry? _dropdownOverlayEntry;
  List<String> _selectedTags = <String>[];

  late List<String> _tags;

  final LayerLink _layerLink = LayerLink();
  final ScrollController _dropdownScrollController = ScrollController(
    initialScrollOffset: 0,
    keepScrollOffset: true,
  );

  @override
  void initState() {
    super.initState();
    _tags = widget.tags;
    _selectedTags = <String>[];
  }

  @override
  void dispose() {
    _dropdownScrollController.dispose();
    _dropdownOverlayEntry?.remove();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_dropdownOverlayEntry == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    final OverlayState overlay = Overlay.of(context);
    _dropdownOverlayEntry = _createDropdownOverlay();
    overlay.insert(_dropdownOverlayEntry!);
  }

  void _removeDropdown() {
    _dropdownOverlayEntry?.remove();
    _dropdownOverlayEntry = null;
  }

  void _updateDropdown() {
    _dropdownOverlayEntry?.markNeedsBuild();
  }

  void _updateSelectedTags(final String tag) {
    widget.onSelectionChange.call(tag);
    if (_selectedTags.contains(tag)) {
      _selectedTags.remove(tag);
    } else {
      _selectedTags.add(tag);
    }
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
                height: widget.tags.isEmpty ?
                        50 :
                        50 * (min(widget.tags.length/3, 4)),
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
                      itemCount: _tags.length,
                      itemBuilder: (final BuildContext context, final int index) {
                        final String tag = _tags.elementAt(index);
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _updateSelectedTags(tag);
                              _updateDropdown();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            color: _selectedTags.contains(tag)
                                ? theme.colorScheme.tertiaryFixed
                                : theme.colorScheme.tertiaryContainer,
                            height: 40,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    tag,
                                    style: TextStyle(
                                      fontSize: theme.textTheme.bodySmall!.fontSize,
                                      color: theme.colorScheme.onTertiaryContainer,
                                    ),
                                  ),
                                ),
                                if (_selectedTags.contains(tag))
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: theme.colorScheme.onTertiaryContainer,
                                    size: 20,
                                  ),
                              ],
                            ),
                          ),
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
    final ThemeData theme = Theme.of(context);
    final bool landscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final Size size = MediaQuery.of(context).size;
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
                            height: landscape ? size.height* 0.135
                                :size.height * 0.051,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: _selectedTags.toList().map((final String tag) => Row(
                                children: <Widget>[
                                  TagChipDropdown(
                                      tagName: tag,
                                      onRemove: () {
                                        setState(() {
                                          _selectedTags.remove(tag);
                                          _updateDropdown();
                                        });
                                      }),
                                  const SizedBox(width: 8),
                                ],
                              )).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedTags.clear();
                              _updateDropdown();
                            });
                          },
                          child: Icon(
                            Icons.clear_outlined,
                            color: theme.colorScheme.onPrimary,
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