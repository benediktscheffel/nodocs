import 'package:file_picker/file_picker.dart';

abstract class FilePickerAdapter {
  Future<FilePickerResult?> pickFiles({required final FileType type, final List<String>? allowedExtensions});
}