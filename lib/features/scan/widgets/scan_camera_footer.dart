import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/widgets/scan_box_last_image.dart';
import 'package:nodocs/features/scan/widgets/scan_camera_button.dart';

class ScanCameraFooter extends StatelessWidget {
  final VoidCallback onTakePhoto;

  const ScanCameraFooter({super.key, required this.onTakePhoto});

  Future<void> _pickImage(final BuildContext context) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null && context.mounted) {
      GoRouter.of(context).push(Uri(
              path: NavigationServiceRoutes.crop,
              queryParameters: <String, String>{'path': pickedFile.path})
          .toString());
    }
  }

  @override
  Widget build(final BuildContext context) {
    final List<Widget> row = <Widget>[
      ScanBoxLastImage(
        // TODO replace the image path with the actual latest image
        img: Image.file(
          File(
              '${ConfigParameters.fileSystemPath}/collection1/annie-spratt-_dAnK9GJvdY-unsplash.jpg'),
        ),
        scanCounter: 6,
        onTap: () {
          GoRouter.of(context).goNamed(NavigationServiceRoutes.save);
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
