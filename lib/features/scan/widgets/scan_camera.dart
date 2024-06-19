import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/widgets/scan_camera_footer.dart';
import 'package:nodocs/util/logging/log.dart';

class ScanCamera extends StatefulWidget {
  final List<CameraDescription> cameras;

  const ScanCamera({super.key, required this.cameras});

  @override
  ScanCameraState createState() => ScanCameraState();
}

class ScanCameraState extends State<ScanCamera> with WidgetsBindingObserver {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  final Logger _log = getLogger();

  Future<void> setCameraAndController() async {
    if (widget.cameras.isNotEmpty) {
      _controller = CameraController(
        widget.cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      _initializeControllerFuture = _controller.initialize().then((final _) {
        if (!mounted) return;
        setState(() {});
      }).catchError((final dynamic e) {
        if (e is CameraException) {
          _log.e('Camera error: ${e.description}');
        } else {
          _log.e('Error initializing camera: $e');
        }
      });
    } else {
      _log.e('No cameras available');
    }
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
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (_controller.value.isInitialized) {
      setCameraAndController();
    }
  }

  Widget _cameraNotAvailable() {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(final BuildContext context) {
    if (_controller.value.isInitialized) {
      return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder:
            (final BuildContext context, final AsyncSnapshot<void> snapshot) {
          if (context.findRenderObject() != null &&
              snapshot.connectionState == ConnectionState.done) {
            final RenderBox renderBox = context.findRenderObject() as RenderBox;
            double height = 0.0;
            double width = 0.0;
            // portrait
            if (renderBox.size.width < renderBox.size.height) {
              height = (renderBox.size.width * _controller.value.aspectRatio) <
                      renderBox.size.height
                  ? renderBox.size.width * _controller.value.aspectRatio
                  : renderBox.size.height;
              width = (height / _controller.value.aspectRatio) >
                      renderBox.size.width
                  ? renderBox.size.width
                  : height / _controller.value.aspectRatio;
            }
            // landscape
            else {
              width = (renderBox.size.height * _controller.value.aspectRatio) <
                      renderBox.size.width
                  ? renderBox.size.height * _controller.value.aspectRatio
                  : renderBox.size.width;
              height = (width / _controller.value.aspectRatio) <
                      renderBox.size.height
                  ? width / _controller.value.aspectRatio
                  : renderBox.size.height;
            }
            return Stack(children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: height,
                        width: width,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: CameraPreview(_controller),
                        ),
                      ),
                    )
                  ]),
              Align(
                alignment: Alignment.bottomCenter,
                child: ScanCameraFooter(
                  onTakePhoto: () async {
                    try {
                      await _initializeControllerFuture;
                      final XFile image = await _controller.takePicture();
                      if (!context.mounted) return;
                      GoRouter.of(context).push(Uri(
                          path: NavigationServiceRoutes.crop,
                          queryParameters: <String, String>{
                            'path': image.path
                          }).toString());
                    } catch (e) {
                      _log.e(e);
                    }
                  },
                ),
              ),
            ]);
          }
          return _cameraNotAvailable();
        },
      );
    }
    return _cameraNotAvailable();
  }
}
