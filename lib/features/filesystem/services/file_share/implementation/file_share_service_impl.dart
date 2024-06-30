
import 'package:archive/archive_io.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/filesystem/services/file_share/file_share_service.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class FileShareServiceImpl implements FileShareService {
  static final Logger _log = getLogger();

  @override
  Future<void> shareCollection(final String path, final String name) async {
    try {
      final File zip = await _createZipFileFromDirectory(path, name);
      await Share.shareXFiles(<XFile>[XFile(zip.path)]);
      await zip.delete();
    } catch (e) {
      _log.e('Error while sharing collection', error: e);
    }
  }

  @override
  Future<void> shareFile(final String path) async {
    Share.shareXFiles(<XFile>[XFile(path)]);
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
