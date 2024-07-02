import 'dart:io';

abstract class FilePickerService {
  Future<File?> pickFile(final String collectionPath);
}
