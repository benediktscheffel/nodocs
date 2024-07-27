import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/widgets/collection_tile.dart';

class CollectionContainer extends StatelessWidget {
  final List<CollectionTile> children;

  const CollectionContainer({super.key, required this.children});

  @override
  Widget build(final BuildContext context) {
    bool landscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:  size.height * 0.6,
          // if orientation is landscape, the width is 96% of the screen width
          maxWidth: landscape? size.width * 0.96: size.width,
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
