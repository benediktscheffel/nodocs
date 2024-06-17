import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/scan/widgets/scan_box_last_image.dart';
import 'package:nodocs/features/scan/widgets/scan_camera_button.dart';
import 'package:nodocs/go_router.dart';

class ScanCameraFooter extends StatelessWidget {
  final VoidCallback onTakePhoto;
  const ScanCameraFooter({super.key, required this.onTakePhoto});

  Future<void> _pickImage(final BuildContext context) async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null && context.mounted) {
      CropPageRoute(path: pickedFile.path).go(context);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final List<Widget> row = <Widget>[
      ScanBoxLastImage(
        // TODO replace the image path with the actual latest image
        img: Image.file(
          File('${ConfigParameters.fileSystemPath}/collection1/annie-spratt-_dAnK9GJvdY-unsplash.jpg'),
        ),
        scanCounter: 6,
        onTap: () {
          const SavePageRoute().go(context);
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
            children: row.map((final Widget rowItem) => Expanded(child: rowItem)).toList(),
          )
        ]
      )
    );
  }
}