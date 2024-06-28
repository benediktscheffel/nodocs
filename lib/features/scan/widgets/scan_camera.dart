import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/scan_controller.dart';
import 'package:nodocs/features/scan/services/camera_service.dart';
import 'package:nodocs/features/scan/widgets/scan_camera_footer.dart';
import 'package:nodocs/util/logging/log.dart';

// ConsumerStatefulWidget because the CameraController is very difficult to handle inside riverpod providers
class ScanCamera extends ConsumerStatefulWidget {
  final ScanController scanController;
  final List<CameraDescription> cameraList;
  final List<String> imagePaths;

  const ScanCamera(
      {super.key, required this.imagePaths, required this.cameraList, required this.scanController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanCameraState();
}

class _ScanCameraState extends ConsumerState<ScanCamera> with WidgetsBindingObserver {
  late CameraController _cameraController;
  final Logger _log = getLogger();

  Future<void> setCameraAndController() async {
    if (widget.cameraList.isNotEmpty) {
      _cameraController = CameraController(
        widget.cameraList.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      try {
        await _cameraController.initialize();
        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        if (e is CameraException) {
          _log.e('Camera error: ${e.description}');
        } else {
          _log.e('Error initializing camera: $e');
        }
      }
    } else {
      _log.e('No cameras available');
    }
  }

  Widget _cameraNotAvailable(final BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.onPrimary,
        )
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addObserver(this);
    setCameraAndController();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (_cameraController.value.isInitialized) {
      setCameraAndController();
    }
  }

  @override
  Widget build(final BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return _cameraNotAvailable(context);
    }

    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return _cameraNotAvailable(context);
    }

    double height = 0.0;
    double width = 0.0;

    // portrait
    if (renderBox.size.width < renderBox.size.height) {
      height = CameraService.calculatePortraitHeight(
        _cameraController.value.aspectRatio,
        renderBox.size.width,
        renderBox.size.height,
      );
      width = CameraService.calculatePortraitWidth(
        _cameraController.value.aspectRatio,
        renderBox.size.width,
        height,
      );
    }
    // landscape
    else {
      width = CameraService.calculateLandscapeWidth(
        _cameraController.value.aspectRatio,
        renderBox.size.width,
        renderBox.size.height,
      );
      height = CameraService.calculateLandscapeHeight(
        _cameraController.value.aspectRatio,
        width,
        renderBox.size.height,
      );
    }

    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: SizedBox(
                height: renderBox.size.height,
                width: renderBox.size.width,
                child: AspectRatio(
                  aspectRatio: _cameraController.value.aspectRatio,
                  child: CameraPreview(_cameraController),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ScanCameraFooter(
            onTakePhoto: () async {
              try {
                final XFile image = await _cameraController.takePicture();
                if (!mounted) return;
                final List<String> images = widget.scanController.addToImagePaths(
                  widget.imagePaths,
                  image.path,
                );
                widget.scanController.goToPage(Uri(
                  path: NavigationServiceRoutes.crop,
                  queryParameters: <String, List<String>> {'path': images},
                ));
              } catch (e) {
                if (mounted) {
                  Center(child: Text(e.toString()));
                }
              }
            },
            imagePaths: widget.imagePaths,
          ),
        ),
      ],
    );
  }
}
