import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_provider.g.dart';

@riverpod
Future<CameraController?> cameraController(
  final CameraControllerRef ref,
) async {
  List<CameraDescription> cameras = await availableCameras();
  final CameraController cameraController =
      CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);
  await cameraController.initialize().catchError((final Object e) {
    if (e is CameraException) {
      switch (e.code) {
        case "CameraAccessDenied":
          break;
        default:
          break;
      }
    }
  });
  return cameraController;
}
