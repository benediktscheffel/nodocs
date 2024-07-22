abstract class FileShareService {
  Future<bool> shareFile(final String path);

  Future<bool> shareCollection(final String path, final String name);
}
