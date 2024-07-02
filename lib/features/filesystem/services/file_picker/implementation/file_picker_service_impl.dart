import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/filesystem/services/file_picker/file_picker_service.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:path/path.dart' as p;

class FilePickerServiceImpl implements FilePickerService {
  static final Logger _log = getLogger();

  @override
  Future<File?> pickFile(final String collectionPath) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>['pdf'],
    );
    if (result != null) {
      PlatformFile pickedFile = result.files.first;

      Directory collectionDir = Directory(collectionPath);
      if (!await collectionDir.exists()) {
        await collectionDir.create(recursive: true);
      }

      File savedFile = File(p.join(collectionDir.path, pickedFile.name));
      _log.i('Saving file to ${savedFile.path}');

      return File(pickedFile.path!).copy(savedFile.path);
    }
    // User canceled the picker
    return null;
  }
}
