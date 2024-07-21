import 'package:archive/archive_io.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/filesystem/services/file_share/file_share_adapter.dart';
import 'package:nodocs/features/filesystem/services/file_share/file_share_service.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class FileShareServiceImpl implements FileShareService {
  late final Logger _log = getLogger();
  final FileShareAdapter _fileShareAdapter;

  FileShareServiceImpl(this._fileShareAdapter);

  @override
  Future<bool> shareCollection(final String path, final String name) async {
    try {
      final File zip = await _createZipFileFromDirectory(path, name);
      final ShareResult shareResult =
          await _fileShareAdapter.shareFile(zip.path);

      await zip.delete();
      if (shareResult.status != ShareResultStatus.success) {
        _log.e('Failed to share the collection');
        return false;
      }
      return true;
    } catch (e) {
      throw Exception(
          LocaleKeys.home_error_screens_sharing_exception_message.tr() +
              e.toString());
    }
  }

  @override
  Future<bool> shareFile(final String path) async {
    final ShareResult shareResult = await _fileShareAdapter.shareFile(path);
    if (shareResult.status != ShareResultStatus.success) {
      _log.e('Failed to share the file');
      return false;
    }
    return true;
  }

  Future<File> _createZipFileFromDirectory(
      final String sourceDirPath, final String zipFileName) async {
    final Directory tempDir = await getTemporaryDirectory();
    final String zipFilePath = '${tempDir.path}/$zipFileName.zip';

    final Archive archive = Archive();

    final Directory sourceDir = Directory(sourceDirPath);
    await for (FileSystemEntity entity in sourceDir.list(recursive: true)) {
      if (entity is File) {
        final List<int> fileBytes = await entity.readAsBytes();
        final String relativePath =
            entity.path.substring(sourceDir.path.length + 1);
        archive.addFile(ArchiveFile(relativePath, fileBytes.length, fileBytes));
      }
    }

    final List<int>? zipData = ZipEncoder().encode(archive);
    final File zipFile = File(zipFilePath);
    await zipFile.writeAsBytes(zipData!);

    return zipFile;
  }
}
