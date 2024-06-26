import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_viewer_model.freezed.dart';

@freezed
class PdfViewerModel with _$PdfViewerModel {
  const factory PdfViewerModel({
    required final List<Tag> tags,
    required final bool showToolbar,
    required final bool showScrollHead,
  }) = _PdfViewerModel;
}

@freezed
class Tag with _$Tag {
  const factory Tag({
    required final String name,
    required final bool selected,
  }) = _Tag;
}
