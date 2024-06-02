import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Theme(
      data: theme,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colorScheme.secondary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(16.0), // Optional
          ),
          child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 14.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                trailing: <Widget>[
                  Tooltip(
                    message: 'Search',
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        controller.openView();
                      },
                    ),
                  )
                ],
                hintText: 'Documents, Tags or Collections',
                hintStyle: WidgetStateProperty.all<TextStyle>(
                  const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'Suggestion $index';
                return ListTile(
                  title: Text('Suggestion $index'),
                  onTap: () {
                    controller.closeView(item);
                  },
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
