import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/search/controller/implementation/search_result_providers.dart';
import 'package:nodocs/features/search/controller/search_result_controller.dart';
import 'package:nodocs/features/search/widgets/search_result_tile.dart';
import 'package:nodocs/gen/locale_keys.g.dart';


class SearchBox extends ConsumerWidget {
  const SearchBox({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final SearchResultController searchResultController = ref.watch(searchResultControllerProvider);
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
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SearchAnchor(
            builder: (final BuildContext context, final SearchController controller) {
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
                onChanged: (final _) {
                  controller.openView();
                },
                trailing: <Widget>[
                  Tooltip(
                    message: LocaleKeys.home_search_message.tr(),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        controller.openView();
                      },
                    ),
                  )
                ],
                hintText: LocaleKeys.home_search_hint_text.tr(),
                hintStyle: WidgetStateProperty.all<TextStyle>(
                  const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              );
            },
            suggestionsBuilder:
                (final BuildContext context, final SearchController controller) async {
              return <Widget>[
                if (controller.text != '')
                  FutureBuilder<List<String>>(
                    future: _debouncedSearch(searchResultController, controller),
                    builder: (final BuildContext context, final AsyncSnapshot<List<String>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.onPrimary,
                          )
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(LocaleKeys.home_search_no_matches_found.tr())
                        );
                      } else {
                        List<String> paths = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: paths.length,
                          itemBuilder: (final BuildContext context, final int index) {
                            final String path = paths[index];
                            final String fileName = path.split('/').last.split('.pdf').first;
                            return SearchResultTile(
                              title: fileName,
                              onTapPdf: () {
                                searchResultController.goToPage(
                                  Uri(
                                    path: NavigationServiceRoutes.pdfViewer,
                                    queryParameters: <String, String>{'path': paths[index]}
                                  )
                                );
                              },
                              path: path,
                              textCount: searchResultController.getCountOfTextOccurrences(path),
                              tags: searchResultController.getTags(path),
                              searchString: controller.text,
                            );
                          }
                        );
                      }
                    }
                  )
              ];
            },
          ),
        ),
      ),
    );
  }

  Future<List<String>> _debouncedSearch(final SearchResultController searchResultController, final SearchController controller) async {
    Completer<List<String>> completer = Completer<List<String>>();
    // Wait 1 second before triggering search
    Timer(const Duration(seconds: 1), () async {
      List<String> paths = await searchResultController.search(controller.text);
      completer.complete(paths);
    });
    return completer.future;
  }
}
