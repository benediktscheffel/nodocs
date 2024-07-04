abstract class ScanController {
  List<String> addToImagePaths(
      final List<String> imagePaths, final String path);

  List<String> removeFromImagePaths(final List<String> imagePaths);

  String getLatestImagePath(final List<String> imagePaths);

  int getScanCounter(final List<String> imagePaths);

  void goToPage(final Uri uri);

  void goBack();
}
