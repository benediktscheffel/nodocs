
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/implementation/scan_provider.dart';
import 'package:nodocs/features/scan/controller/scan_controller.dart';
import 'package:nodocs/features/scan/widgets/scan_box_last_image.dart';
import 'package:nodocs/features/scan/widgets/scan_camera_button.dart';

class ScanCameraFooter extends ConsumerWidget {
  final VoidCallback onTakePhoto;
  final List<String> imagePaths;

  const ScanCameraFooter({super.key, required this.onTakePhoto, required this.imagePaths});

  Future<void> _pickImage(final BuildContext context, final ScanController scanController) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null && context.mounted) {
      List<String> images = scanController.addToImagePaths(imagePaths, pickedFile.path);
      GoRouter.of(context).push(Uri(
          path: NavigationServiceRoutes.crop,
          queryParameters: <String, List<String>>{
            'path': images
          }).toString());
    }
  }

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final ScanController scanController = ref.watch(scanControllerProvider);
    final List<Widget> row = <Widget>[
      ScanBoxLastImage(
        // TODO replace the image path with the actual latest image
        imgPath: scanController.getLatestImagePath(imagePaths),
        scanCounter: scanController.getScanCounter(imagePaths),
        onTap: () {
          GoRouter.of(context).push(NavigationServiceRoutes.save);
        },
      ),
      ScanCameraButton(
        onAnimationEnd: () {
          onTakePhoto.call();
        },
      ),
      InkWell(
        onTap: () {
          _pickImage(context, scanController);
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
