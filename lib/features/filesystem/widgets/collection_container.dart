import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/widgets/collection_tile.dart';

class CollectionContainer extends StatelessWidget {
  final List<CollectionTile> children;

  const CollectionContainer({super.key, required this.children});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    bool landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:  size.height * 0.6,
          maxWidth: landscape? size.width * 0.86 : size.width,
        ),
        child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(23),
            decoration: children.isNotEmpty? BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(16),
            ): null,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            )
        )
    );
  }
}
