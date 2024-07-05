import 'package:logger/logger.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/file_system_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/search/controller/search_result_controller.dart';
import 'package:nodocs/features/search/model/search_result_model.dart';
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_result_controller_impl.g.dart';
@riverpod
class SearchResultControllerImpl extends _$SearchResultControllerImpl implements SearchResultController {
  final Logger _log = Logger();

  @override
  SearchResultModel build({
    required final FileSystemService fileSystemService,
    required final NavigationService navigationService,
    required final PersistenceService persistenceService,
  }){
    return const SearchResultModel(
        tagResults: <String, List<String>>{},
        fileResults: <String>[],
        textResults: <String, int>{}
    );
  }


  Future<void> _setTagResults(final String search, final List<String> pdfPaths) async {
    Map<String, List<String>> tagResults = <String, List<String>>{};
    for (final String path in pdfPaths) {
      final List<String> tags = persistenceService.loadTags(path)
          .where((final (String, bool) tag) => tag.$2 && tag.$1.contains(search))
          .map((final (String, bool) tag) => tag.$1)
          .toList();
      if (tags.isNotEmpty) {
        tagResults[path] = tags;
      }
    }
    state = state.copyWith(tagResults: tagResults);
  }

  Future<void> _setFileResults(final String search, final List<String> pdfPaths) async {
    Map<String, int> textResults = <String, int>{};
    for (final String path in pdfPaths) {
      final int occurrencesOfSearch = await fileSystemService.getCountOfTextOccurrencesInPdf(path, search);
      if (occurrencesOfSearch > 0) {
        textResults[path] = occurrencesOfSearch;
      }
    }
    state = state.copyWith(textResults: textResults);
  }

  Future<void> _setTextResults(final String search, final List<String> pdfPaths) async {
    List<String> fileResults = <String>[];
    for (final String path in pdfPaths) {
      final String fileName = path.split('/').last.split('.pdf').first;
      if (fileName.contains(search)) {
        fileResults.add(path);
      }
    }
    state = state.copyWith(fileResults: fileResults);
  }


  @override
  Future<List<String>> search(final String search) async {
    final List<String> pdfPaths = await fileSystemService.getAllPdfPaths();
    await Future.wait(<Future<void>>[
      _setTagResults(search, pdfPaths),
      _setFileResults(search, pdfPaths),
      _setTextResults(search, pdfPaths),
    ]);
    List<String> path = <String>{...state.fileResults, ...state.tagResults.keys, ...state.textResults.keys}.toList();
    path.sort();
    return path;
  }

  @override
  void goToPage(final Uri uri) {
    navigationService.push(uri.toString());
  }

  @override
  int getCountOfTextOccurrences(final String path) {
    return state.textResults[path] ?? 0;
  }

  @override
  List<String> getTags(final String path) {
    return state.tagResults[path] ?? <String>[];
  }
}
