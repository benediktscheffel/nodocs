import 'package:nodocs/features/scan/services/image_service.dart';

class ImageServiceImpl implements ImageService {
  @override
  List<String> removeFromImagePaths(final List<String> imagePaths) {
    if (imagePaths.isNotEmpty) {
      String path = imagePaths.last;
      return <String>[...imagePaths]..remove(path);
    }
    return <String>[];
  }

  @override
  List<String> addToImagePaths(
      final List<String> imagePaths, final String path) {
    if (imagePaths.isNotEmpty) {
      return <String>[...imagePaths, path];
    }
    return <String>[path];
  }

  @override
  String getLatestImagePath(final List<String> imagePaths) {
    if (imagePaths.isNotEmpty) {
      return imagePaths.last;
    }
    return '';
  }

   @override
  List<String> replaceImagePath(final String oldPath,
      final String newPath, final List<String> imagePaths) {
    if (!imagePaths.contains(oldPath)) {
      return imagePaths;
    }
    int oldIndex = imagePaths.indexOf(oldPath);
    List<String> updatedImagePaths = List<String>.from(imagePaths);
    updatedImagePaths[oldIndex] = newPath;

    return updatedImagePaths;
  }
}
