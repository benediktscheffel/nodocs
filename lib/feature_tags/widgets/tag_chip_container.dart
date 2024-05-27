import 'package:flutter/material.dart';

import 'package:nodocs/feature_tags/widgets/tag_chip.dart';

class TagChipContainer extends StatelessWidget {
  final List<(String, bool)> tagData;

  const TagChipContainer({
    super.key,
    required this.tagData
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.0,
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Wrap(
              direction: Axis.horizontal,
              spacing: 8.0,
              runSpacing: 4.0,
              clipBehavior: Clip.hardEdge,
              children: tagData.map((tag) => TagChip(tagName: tag.$1, tagState: tag.$2)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}