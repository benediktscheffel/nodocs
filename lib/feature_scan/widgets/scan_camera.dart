import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ScanCamera extends StatefulWidget {
  final List<CameraDescription> cameras;

  const ScanCamera({super.key, required this.cameras});

  @override
  ScanCameraState createState() => ScanCameraState();
}

class ScanCameraState extends State<ScanCamera> with WidgetsBindingObserver {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  Future<void> setCameraAndController() async {
    if (widget.cameras.isNotEmpty) {
      _controller = CameraController(
        widget.cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      _initializeControllerFuture = _controller.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      }).catchError((final e) {
        if (e is CameraException) {
          print('Camera error: ${e.description}');
        } else {
          print('Error initializing camera: $e');
        }
      });
    } else {
      print('No cameras available');
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
      return Expanded(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (final BuildContext context, final AsyncSnapshot<void> snapshot) {
            if (context.findRenderObject() != null && snapshot.connectionState == ConnectionState.done) {
              final RenderBox renderBox = context.findRenderObject() as RenderBox;
              double height = 0.0;
              double width = 0.0;
              // portrait
              if (renderBox.size.width < renderBox.size.height) {
                height = (renderBox.size.width * _controller.value.aspectRatio) < renderBox.size.height ? renderBox.size.width * _controller.value.aspectRatio : renderBox.size.height;
                width = (height / _controller.value.aspectRatio) > renderBox.size.width ? renderBox.size.width : height / _controller.value.aspectRatio;
              }
              // landscape
              else {
                width = (renderBox.size.height * _controller.value.aspectRatio) < renderBox.size.width ? renderBox.size.height * _controller.value.aspectRatio : renderBox.size.width;
                height = (width / _controller.value.aspectRatio) < renderBox.size.height ? width / _controller.value.aspectRatio : renderBox.size.height;
              }
              return Stack(
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
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton(
                      // Provide an onPressed callback.
                      onPressed: () async {
                        // Take the Picture in a try / catch block. If anything goes wrong,
                        // catch the error.
                        try {
                          // Ensure that the camera is initialized.
                          await _initializeControllerFuture;

                          // Attempt to take a picture and get the file `image`
                          // where it was saved.
                          final image = await _controller.takePicture();

                          if (!context.mounted) return;

                          // If the picture was taken, display it on a new screen.
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DisplayPictureScreen(
                                // Pass the automatically generated path to
                                // the DisplayPictureScreen widget.
                                imagePath: image.path,
                              ),
                            ),
                          );
                        } catch (e) {
                          // If an error occurs, log the error to the console.
                          print(e);
                        }
                      },
                      child: const Icon(Icons.camera_alt),
                    ),
                  )
                ]);
            }
            return _cameraNotAvailable();
          },
        ),
      );
    }
    return _cameraNotAvailable();
  }
}

// A widget that displays the picture taken by the user.
// TODO delete this when the Crop Screen is attached to the workflow
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body:  Center(child: Image.file(File(imagePath))),
    );
  }
}