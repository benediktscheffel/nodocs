import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/feature_filesystem/widgets/collection_tile.dart';


class CollectionContainer extends StatefulWidget {

  const CollectionContainer({super.key});
  
  @override
  State<StatefulWidget> createState() => _CollectionContainerState(); 
}

class _CollectionContainerState extends State<CollectionContainer> {

  List<CollectionTile> _items = <CollectionTile>[];
  String _currentAbsolutePath = '/data/data/com.example.nodocs/files/';

  @override
  void initState() {
    super.initState();
    _currentAbsolutePath = '/data/data/com.example.nodocs/files/';
    _listItems();
  }

  Future<void> _listItems() async {
    final Directory directory = Directory(_currentAbsolutePath);
    final List<CollectionTile> items = <CollectionTile>[];

    try {
      final List<FileSystemEntity> entities = directory.listSync();
      for (FileSystemEntity entity in entities) {
        if (entity is Directory) {
          items.add(CollectionTile(
            title: entity.path.split('/').last,
            path: entity.path,
            leading: Icons.folder,
          ));
        }
        if (entity is File && entity.path.endsWith('.pdf')) {
          items.add(CollectionTile(
            title: entity.path.split('/').last.replaceAll('.pdf', ''),
            /*onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (final BuildContext context) {
                  return PdfViewer(path: entity.path);
                },
              )
              );
            },*/
            leading: Icons.picture_as_pdf_outlined,
            path: entity.path,
          ));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error listing directories: $e');
      }
    }

    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(final BuildContext context) {
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
            children: _items,
          ),
        ),
      ),
    );
  }

}
