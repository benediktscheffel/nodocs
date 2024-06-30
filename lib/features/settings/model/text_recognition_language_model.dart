import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_recognition_language_model.freezed.dart';

@freezed
class TextRecognitionLanguageModel with _$TextRecognitionLanguageModel {
  const factory TextRecognitionLanguageModel(
          {required final String selectedLanguageCode,
          required final Map<String, String> languages}) =
      _TextRecognitionLanguageModel;
}
