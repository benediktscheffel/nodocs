import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result_model.freezed.dart';

@freezed
class SearchResultModel with _$SearchResultModel {
  const factory SearchResultModel({
    required final Map<String, List<String>> tagResults,
    required final List<String> fileResults,
    required final Map<String, int> textResults,
  }) = _SearchResultModel;
}