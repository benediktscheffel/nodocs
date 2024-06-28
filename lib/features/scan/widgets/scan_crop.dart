import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:nodocs/features/scan/controller/crop_controller.dart';
import 'package:nodocs/features/scan/controller/implementation/crop_provider.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button_container.dart';

class ScanCrop extends ConsumerStatefulWidget {
  final List<String> imagePaths;

  const ScanCrop({super.key, required this.imagePaths});

  @override
  ConsumerState<ScanCrop> createState() => _ScanCropState();
}

class _ScanCropState extends ConsumerState<ScanCrop> {
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeController();
  }

  Future<void> _initializeController() async {
    final CropController controller = ref.read(cropControllerProvider);
    controller.init(widget.imagePaths);
  }

  @override
  Widget build(final BuildContext context) {
    final CropController controller = ref.watch(cropControllerProvider);
    return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (final BuildContext context, final AsyncSnapshot<void> snapshot) {
      final CroppedFile? croppedImage = controller.getCroppedImage();
      final XFile? pickedImage = controller.getPickedImage();
      final double screenWidth =
          MediaQuery
              .of(context)
              .size
              .width;
      final double screenHeight =
          MediaQuery
              .of(context)
              .size
              .height;
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4.0,
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Builder(
                      builder: (final BuildContext context) {
                        if (croppedImage != null) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 0.8 * screenWidth,
                              maxHeight: 0.7 * screenHeight,
                            ),
                            child: Image.file(File(croppedImage.path)),
                          );
                        } else if (pickedImage != null) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 0.8 * screenWidth,
                              maxHeight: 0.7 * screenHeight,
                            ),
                            child: Image.file(File(pickedImage.path)),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )),
              ),
            ),
            const SizedBox(height: 24.0),
            ScanActionButtonContainer(
              buttons: <Widget>[
                ScanActionButton(
                  buttonIcon: Icons.crop_outlined,
                  buttonText: 'Crop',
                  onPressed: () async {
                    final XFile? pickedImage = controller.getPickedImage();
                    if (pickedImage == null) return;
                    CroppedFile? croppedFile = await controller.cropImage(
                        Theme.of(context), pickedImage, context);
                    if (croppedFile != null) {
                      controller.setCroppedImage(croppedFile);
                      controller.replaceImagePath(croppedFile.path);
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
