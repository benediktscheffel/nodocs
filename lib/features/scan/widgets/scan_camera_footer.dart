import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodocs/features/scan/widgets/scan_box_last_image.dart';
import 'package:nodocs/features/scan/widgets/scan_camera_button.dart';
import 'package:nodocs/gen/locale_keys.g.dart';

class ScanCameraFooter extends StatelessWidget {
  final ValueChanged<String> onImageSelected;
  final VoidCallback onTakePhoto;
  final VoidCallback onLastImageTapped;
  final List<String> imagePaths;
  final String latestImagePath;
  final double orientationAngle;

  const ScanCameraFooter(
      {super.key,
      required this.onTakePhoto,
      required this.imagePaths,
      required this.onImageSelected,
      required this.onLastImageTapped,
      required this.orientationAngle,
      required this.latestImagePath});

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
      Transform.rotate(
        angle: orientationAngle,
        child: ScanBoxLastImage(
          imgPath: latestImagePath,
          scanCounter: imagePaths.length,
          onTap: () {
            onLastImageTapped.call();
          },
        ),
      ),
      Transform.rotate(
        angle: orientationAngle,
        child: Column(
          children: <Widget>[
            Text(
              LocaleKeys.scan_footer_scan_document.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Semantics(
              identifier: 'scan_camera_button',
              child: ScanCameraButton(
                onAnimationEnd: () {
                  onTakePhoto.call();
                },
              ),
            ),
          ],
        ),
      ),
      InkWell(
        onTap: () {
          _pickImage(context);
        },
        child: Transform.rotate(
          angle: orientationAngle,
          child: const Icon(
            Icons.photo_library_outlined,
            color: Colors.white,
          ),
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
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: row
                .map((final Widget rowItem) => Expanded(child: rowItem))
                .toList(),
          ),
        ],
      ),
    );
  }
}
