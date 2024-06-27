import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/scan_controller.dart';
import 'package:nodocs/features/scan/services/camera_service.dart';
import 'package:nodocs/features/scan/widgets/scan_camera_footer.dart';

class ScanCamera extends ConsumerWidget {
  final ScanController scanController;
  final CameraController cameraController;
  final List<String> imagePaths;
  const ScanCamera({super.key, required this.imagePaths, required this.cameraController, required this.scanController});

  Widget _cameraNotAvailable(final BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.onPrimary,
        )
    );
  }

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return FutureBuilder<void>(
      future: cameraController.initialize(),
      builder:
          (final BuildContext context, final AsyncSnapshot<void> snapshot) {
        if (context.findRenderObject() != null &&
            snapshot.connectionState == ConnectionState.done) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          double height = 0.0;
          double width = 0.0;
          // portrait
          if (renderBox.size.width < renderBox.size.height) {
            height = CameraService.calculatePortraitHeight(
              cameraController.value.aspectRatio,
              renderBox.size.width,
              renderBox.size.height,
            );
            width = CameraService.calculatePortraitWidth(
              cameraController.value.aspectRatio,
              renderBox.size.width,
              height,
            );
          }
          // landscape
          else {
            width = CameraService.calculateLandscapeWidth(
              cameraController.value.aspectRatio,
              renderBox.size.width,
              renderBox.size.height,
            );
            height = CameraService.calculateLandscapeHeight(
              cameraController.value.aspectRatio,
              width,
              renderBox.size.height,
            );
          }
          return Stack(children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: renderBox.size.height,
                      width: renderBox.size.width,
                      child: AspectRatio(
                        aspectRatio: cameraController.value.aspectRatio,
                        child: CameraPreview(cameraController),
                      ),
                    ),
                  )
                ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: ScanCameraFooter(
                onTakePhoto: () async {
                  try {
                    final XFile image = await cameraController.takePicture();
                    if (!context.mounted) return;
                    final List<String> images = scanController.addToImagePaths(imagePaths, image.path);
                    GoRouter.of(context).push(Uri(
                        path: NavigationServiceRoutes.crop,
                        queryParameters: <String, List<String>>{
                          'path': images,
                        }).toString());
                  } catch (e) {
                    if (context.mounted) {
                      Center(child: Text(e.toString()));
                    }
                  }
                },
                imagePaths: imagePaths,
              ),
            ),
          ]);
        }
        return _cameraNotAvailable(context);
      },
    );
  }
}
