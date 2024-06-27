
class ImageService {
  static List<String> removeFromImagePaths(final List<String> imagePaths) {
    if (imagePaths.isNotEmpty) {
      String path = imagePaths.last;
      return <String>[...imagePaths]..remove(path);
    }
    return <String>[];
  }

  static List<String> addToImagePaths(final List<String> imagePaths, final String path) {
    if (imagePaths.isNotEmpty) {
      return <String>[...imagePaths, path];
    }
    return <String>[path];
  }

  static String getLatestImagePath(final List<String> imagePaths) {
    if (imagePaths.isNotEmpty) {
      return imagePaths.last;
    }
    return '';
  }
}