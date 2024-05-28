import 'package:flutter/material.dart';
import 'package:nodocs/widgets/collection_tile.dart';

class CollectionContainer extends StatelessWidget {
  final List<CollectionTile> collectionItems;

  const CollectionContainer({
    super.key,
    required this.collectionItems,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.all(23),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: collectionItems,
              ),
            ),
        ),
    );
  }
}
