import 'package:flutter/material.dart';
import 'package:nodocs/widgets/collection_tile.dart';

class CollectionContainer extends StatelessWidget {
  final List<CollectionTile> collectionItems;

  const CollectionContainer({
    super.key,
    required this.collectionItems,
  });

  // Add a scrollbar if the container overflows

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: collectionItems,
                ),
              )
            ),
          )
    );
  }
}
