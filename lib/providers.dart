import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FutureProvider<List<CameraDescription>> cameraProvider =
    FutureProvider<List<CameraDescription>>(
        (final FutureProviderRef<List<CameraDescription>> ref) async {
  final List<CameraDescription> cameras = await availableCameras();
  return cameras;
});
