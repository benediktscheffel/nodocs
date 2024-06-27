import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/scan/services/image_service.dart';

abstract class ScanController {
  List<String> addToImagePaths(final List<String> imagePaths, final String path);
  List<String> removeFromImagePaths(final List<String> imagePaths);
  String getLatestImagePath(final List<String> imagePaths);
  int getScanCounter(final List<String> imagePaths);

  AsyncValue<CameraController?> getCameraController();
  void clearCameraController();
}