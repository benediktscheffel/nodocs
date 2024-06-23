import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_viewer_model.freezed.dart';



@freezed
class PdfViewerModel with _$PdfViewerModel {
  const factory PdfViewerModel({
    required final String path,
    required final List<Tag> tags,
  }) = _PdfViewerModel;
}

@freezed
class Tag with _$Tag {
  const factory Tag({
    required final String name,
  }) = _Tag;
}
