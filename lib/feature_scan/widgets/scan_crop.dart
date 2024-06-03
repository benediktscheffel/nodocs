import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodocs/feature_scan/widgets/scan_action_button.dart';
import 'package:nodocs/feature_scan/widgets/scan_action_button_container.dart';

class ScanCrop extends StatefulWidget {
  final String path;

  const ScanCrop({super.key, required this.path});

  @override
  State<StatefulWidget> createState() => _ScanCropState();
}

class _ScanCropState extends State<ScanCrop> {
  XFile? _pickedFile;
  CroppedFile? _croppedFile;

  void createXFile() {
    setState(() {
      _pickedFile = widget.path.isNotEmpty ? XFile(widget.path) : XFile('/data/data/com.example.nodocs/files/annie-spratt-askpr0s66Rg-unsplash.jpg');
    });
  }

  @override
  void initState() {
    super.initState();
    createXFile();
  }

  @override
  void dispose() {
    setState(() {
      _pickedFile = null;
      _croppedFile = null;
    });
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4.0,
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Builder(
                      builder: (final BuildContext context) {
                        final double screenWidth = MediaQuery.of(context).size.width;
                        final double screenHeight = MediaQuery.of(context).size.height;
                        if (_croppedFile != null) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 0.8 * screenWidth,
                              maxHeight: 0.7 * screenHeight,
                            ),
                            child: Image.file(File(_croppedFile!.path)),
                          );
                        } else if (_pickedFile != null) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 0.8 * screenWidth,
                              maxHeight: 0.7 * screenHeight,
                            ),
                            child: Image.file(File(_pickedFile!.path)),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            ScanActionButtonContainer(
              buttons: <Widget>[
                ScanActionButton(
                  buttonIcon: Icons.crop_outlined,
                  buttonText: 'Crop',
                  onPressed: () {
                    _cropImage();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: <PlatformUiSettings>[
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }
}