abstract class ImageService {
  List<String> removeFromImagePaths(final List<String> imagePaths);
  List<String> addToImagePaths(final List<String> imagePaths, final String path);
  String getLatestImagePath(final List<String> imagePaths);
  List<String> replaceImagePath(final String oldPath, final String newPath, final List<String> imagePaths);
}