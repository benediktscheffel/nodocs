import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/implementation/scan_provider.dart';
import 'package:nodocs/features/scan/controller/scan_controller.dart';
import 'package:nodocs/features/scan/widgets/scan_camera.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/providers/camera_provider.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/title_with_button.dart';

class ScanPage extends ConsumerStatefulWidget {
  final List<String> imagePaths;

  const ScanPage({super.key, required this.imagePaths});

  @override
  ConsumerState<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends ConsumerState<ScanPage> {
  double orientationAngle = 0.0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  void clear() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[]);
  }

  @override
  Widget build(final BuildContext context) {
    final ScanController scanController = ref.watch(scanControllerProvider);
    final AsyncValue<List<CameraDescription>> cameraListAsyncValue =
        ref.watch(cameraProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: TitleWithButton(
          title: "",
          icon: Icons.home_outlined,
          onButtonClick: () => showDialog<String>(
            context: context,
            builder: (final BuildContext context) => ConfirmationDialog(
                onConfirm: () {
                  scanController.goBackHome();
                  clear();
                },
                onCancel: () {
                  scanController.goBack();
                },
                header: LocaleKeys.scan_discard_dialog_header.tr(),
                notificationText: LocaleKeys.scan_discard_dialog_body.tr()),
          ),
          orientationAngle: orientationAngle,
        ),
      ),
      body: cameraListAsyncValue.when(
          data: (final List<CameraDescription> cameras) {
            if (cameras.isEmpty) {
              return const Center(child: Text('No camera found'));
            }
            return ScanCamera(
              imagePaths: widget.imagePaths,
              cameraList: cameras,
              onPhoto: (final XFile image) {
                final List<String> images = scanController.addToImagePaths(
                  widget.imagePaths,
                  image.path,
                );
                scanController.goToPage(Uri(
                  path: NavigationServiceRoutes.crop,
                  queryParameters: <String, List<String>>{'path': images},
                ));
                clear();
              },
              onImageSelected: (final String path) {
                List<String> images =
                    scanController.addToImagePaths(widget.imagePaths, path);
                scanController.goToPage(Uri(
                    path: NavigationServiceRoutes.crop,
                    queryParameters: <String, List<String>>{'path': images}));
                clear();
              },
              onLastImageTapped: () {
                scanController.goToPage(Uri(
                    path: NavigationServiceRoutes.save,
                    queryParameters: <String, List<String>>{
                      'path': widget.imagePaths
                    }));
                clear();
              },
              onOrientationAngleChanged: (final double orientation) {
                setState(() {
                  orientationAngle = orientation;
                });
              },
              latestImagePath:
                  scanController.getLatestImagePath(widget.imagePaths),
            );
          },
          loading: () => Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )),
          error: (final Object err, final StackTrace stack) {
            return Center(child: Text('$err'));
          }),
    );
  }
}
