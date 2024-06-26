
class CameraService {
  static double calculatePortraitHeight(final double aspectRatio,
      final double width, final double height) {
    return (width * aspectRatio) < height
        ? width * aspectRatio
        : height;
  }

  static double calculatePortraitWidth(final double aspectRatio,
      final double width, final double height) {
    return (height / aspectRatio) > width
        ? width
        : height / aspectRatio;
  }

  static double calculateLandscapeHeight(final double aspectRatio,
      final double width, final double height) {
    return (height * aspectRatio) <
        width
        ? height * aspectRatio
        : width;
  }

  static double calculateLandscapeWidth(final double aspectRatio,
      final double width, final double height) {
    return (width / aspectRatio) <
        height
        ? width / aspectRatio
        : height;
  }
}