import 'package:file_picker/file_picker.dart';
import 'package:nodocs/features/filesystem/services/file_picker/file_picker_adapter.dart';

class FilePickerAdapterImpl implements FilePickerAdapter {
  @override
  Future<FilePickerResult?> pickFiles({required final FileType type, final List<String>? allowedExtensions}) {
    return FilePicker.platform.pickFiles(type: type, allowedExtensions: allowedExtensions);
  }
}