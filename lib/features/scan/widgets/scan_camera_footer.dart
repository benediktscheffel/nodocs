
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/features/scan/widgets/scan_box_last_image.dart';
import 'package:nodocs/features/scan/widgets/scan_camera_button.dart';

class ScanCameraFooter extends StatelessWidget {
  final ValueChanged<String> onImageSelected;
  final VoidCallback onTakePhoto;
  final VoidCallback onLastImageTapped;
  final List<String> imagePaths;

  const ScanCameraFooter({super.key, required this.onTakePhoto, required this.imagePaths, required this.onImageSelected, required this.onLastImageTapped});

  Future<void> _pickImage(final BuildContext context) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null && context.mounted) {
      onImageSelected.call(pickedFile.path);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final List<Widget> row = <Widget>[
      ScanBoxLastImage(
        imgPath: ImageService.getLatestImagePath(imagePaths),
        scanCounter: imagePaths.length,
        onTap: () {
          onLastImageTapped.call();
        },
      ),
      ScanCameraButton(
        onAnimationEnd: () {
          onTakePhoto.call();
        },
      ),
      InkWell(
        onTap: () {
          _pickImage(context);
        },
        child: const Icon(
          Icons.photo_library_outlined,
          color: Colors.white,
        ),
      ),
    ];

    return Container(
        height: 150,
        decoration: const BoxDecoration(
          color: Color(0x77000000),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Scan Document',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: row
                    .map((final Widget rowItem) => Expanded(child: rowItem))
                    .toList(),
              )
            ]));
  }
}
