import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodocs/feature_scan/widgets/scan_box_last_image.dart';
import 'package:nodocs/feature_scan/widgets/scan_camera_button.dart';

class ScanCameraFooter extends StatelessWidget {
  final VoidCallback onTakePhoto;
  const ScanCameraFooter({super.key, required this.onTakePhoto});

  Future<void> _pickImage() async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // TODO pass the image to the Crop View
    }
  }

  @override
  Widget build(final BuildContext context) {
    final List<Widget> row = <Widget>[
      ScanBoxLastImage(
        // TODO replace the image path with the actual latest image
        /*img: Image.network(
          'https://images.thalia.media/03/-/684f7c82fc2a499bb90cf9140bd8fe27/harry-potter-und-der-stein-der-weisen-taschenbuch-j-k-rowling.jpeg'
        ),*/
        img: Image.file(
          File('/data/data/com.example.nodocs/files/Collection1/annie-spratt-_dAnK9GJvdY-unsplash.jpg'),
          //File('/data/data/com.example.nodocs/files/annie-spratt-askpr0s66Rg-unsplash.jpg'),
        ),
        scanCounter: 6,
        onTap: () {
          // TODO go to finished Scans View
        },
      ),
      ScanCameraButton(
        onAnimationEnd: () {
          onTakePhoto.call();
        },
      ),
      InkWell(
        onTap: () {
          _pickImage();
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