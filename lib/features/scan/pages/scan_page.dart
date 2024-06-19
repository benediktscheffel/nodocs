import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/widgets/scan_camera.dart';
import 'package:nodocs/providers.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/title_with_button.dart';

class ScanPage extends ConsumerWidget {
  const ScanPage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final AsyncValue<List<CameraDescription>> cameraListAsyncValue = ref.watch(cameraProvider);
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
      body: cameraListAsyncValue.when(
        data: (final List<CameraDescription> cameraList) {
          return ScanCamera(cameras: cameraList,);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (final Object err, final StackTrace stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}