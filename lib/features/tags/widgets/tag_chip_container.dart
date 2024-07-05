import 'package:flutter/material.dart';

import 'package:nodocs/features/tags/widgets/tag_chip.dart';
import 'package:nodocs/features/tags/widgets/tag_input.dart';

class TagChipContainer extends StatefulWidget {
  final List<(String, bool)> tagData;

  const TagChipContainer({super.key, required this.tagData});

  @override
  State<TagChipContainer> createState() => _TagChipContainerState();
}

class _TagChipContainerState extends State<TagChipContainer> {
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.0873,
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Wrap(
              direction: Axis.horizontal,
              spacing: 8.0,
              runSpacing: 4.0,
              clipBehavior: Clip.hardEdge,
              children: widget.tagData
                  .map((final (String, bool) tag) => TagChip(
                        heightOfParent: size.height * 0.0873,
                        tagName: tag.$1,
                        tagState: tag.$2,
                        onSelected: (final bool value) {
                          setState(() {
                            widget.tagData[widget.tagData.indexWhere(
                                (final (String, bool) tagI) =>
                                    tagI.$1 == tag.$1)] = (tag.$1, value);
                          });
                        },
                      ))
                  .toList(),
            ),
            TagInput(
              addTag: _addTag(),
            )
          ],
        ),
      ),
    );
  }

  Function(String) _addTag() {
    return (final String tagName) {
      setState(() {
        widget.tagData.add((tagName, true));
      });
    };
  }
}
