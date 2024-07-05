import 'dart:io';
import 'dart:typed_data';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/file_system_service.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class FileSystemServiceImpl implements FileSystemService {

  @override
  Future<Directory>? createCollection(final String name) {
    if (name.isEmpty) {
      return null;
    }
    return Directory('${ConfigParameters.fileSystemPath}$name').create();
  }

  @override
  Future<FileSystemEntity>? deleteCollectionOrFile(final String path) {
    if (path.isEmpty) {
      return null;
    }
    if (path.endsWith('.pdf')) {
      return _deletePdfFile(path);
    }
    return _deleteCollection(path);
  }

  Future<FileSystemEntity>? _deleteCollection(final String path) {
    final Directory directory = Directory(path);
    if (directory.existsSync()) {
      return directory.delete(recursive: true);
    }
    return null;
  }

  Future<FileSystemEntity>? _deletePdfFile(final String path) {
    final File file = File(path);
    if (file.existsSync()) {
      return file.delete();
    }
    return null;
  }

  Future<Directory>? _renameCollection(
      final String oldPath, final String newName) {
    if (oldPath.isEmpty || newName.isEmpty) {
      return null;
    }
    final Directory oldDirectory = Directory(oldPath);
    if (oldDirectory.existsSync()) {
      final Directory newDirectory =
          Directory('${oldDirectory.parent.path}/$newName');
      return oldDirectory.rename(newDirectory.path);
    }
    return null;
  }

  Future<File>? _renamePdfFile(final String oldPath, final String newName) {
    if (oldPath.isEmpty || newName.isEmpty) {
      return null;
    }
    final File oldFile = File(oldPath);
    if (oldFile.existsSync()) {
      final File newFile =
          File('${oldFile.parent.path}/${_nameToPdf(newName)}');
      return oldFile.rename(newFile.path);
    }
    return null;
  }

  @override
  Future<FileSystemEntity>? renameCollectionOrFile(
      final String oldPath, final String newName) {
    if (oldPath.endsWith('.pdf')) {
      return _renamePdfFile(oldPath, newName);
    }
    return _renameCollection(oldPath, newName);
  }

  String _nameToPdf(final String name) {
    return name.endsWith('.pdf') ? name : '$name.pdf';
  }

  @override
  String getRootDirectory() {
    return ConfigParameters.fileSystemPath;
  }

  @override
  Future<int> getCountOfTextOccurrencesInPdf(final String path, final String text) async {
    PdfDocument document = PdfDocument(inputBytes: await _readDocumentData(path));
    PdfTextExtractor extractor = PdfTextExtractor(document);
    List<MatchedItem> findResult = extractor.findText(<String>[text]);
    document.dispose();
    return findResult.length;
  }

  Future<Uint8List> _readDocumentData(final String path) async {
    return File(path).readAsBytes();
  }

  @override
  Future<List<String>> getAllPdfPaths() async {
    final Directory directory = Directory(getRootDirectory());
    final List<FileSystemEntity> entities = await directory.list(recursive: true, followLinks: false).toList();
    return entities
        .where((final FileSystemEntity entity) => entity is File && entity.path.endsWith('.pdf'))
        .map((final FileSystemEntity entity) => entity.path)
        .toList();
  }
}
