import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/implementation/scan_provider.dart';
import 'package:nodocs/features/scan/controller/scan_controller.dart';
import 'package:nodocs/features/scan/widgets/scan_camera.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/title_with_button.dart';

class ScanPage extends ConsumerWidget {
  final List<String> imagePaths;
  const ScanPage({super.key, required this.imagePaths});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final ScanController scanController = ref.watch(scanControllerProvider);
    final AsyncValue<CameraController?> cameraController = scanController.getCameraController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: TitleWithButton(
          title: "",
          icon: Icons.home_outlined,
          onButtonClick: () => showDialog<String>(
            context: context,
            builder: (final BuildContext context) =>
              ConfirmationDialog(
                onConfirm: (){
                  // TODO delete all saved images of the scan
                  GoRouter.of(context).go(NavigationServiceRoutes.home);
                },
                onCancel: (){
                  GoRouter.of(context).pop();
                },
                header: 'Discard this scan?',
                notificationText: 'Are you sure you want to discard this scan without saving? This will discard all pages of this scan.'
              ),
          ),
        ),
      ),
      body: cameraController.when(
        data: (final CameraController? controller) {
          if (controller == null) {
            return const Center(child: Text('No camera found'));
          }
          return ScanCamera(imagePaths: imagePaths, cameraController: controller, scanController: scanController);
        },
        loading: () => Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
          )
        ),
        error: (final Object err, final StackTrace stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}