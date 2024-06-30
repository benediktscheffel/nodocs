abstract class FileShareService {
  Future<void> shareFile(final String path);

  Future<void> shareCollection(final String path, final String name);
}
