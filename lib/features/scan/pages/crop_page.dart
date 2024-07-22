import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/crop_controller.dart';
import 'package:nodocs/features/scan/controller/implementation/crop_provider.dart';
import 'package:nodocs/features/scan/widgets/scan_crop.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';

import 'package:nodocs/widgets/title_with_button.dart';

class CropPage extends ConsumerWidget {
  final List<String> imagePaths;

  const CropPage({super.key, required this.imagePaths});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final CropController controller = ref.watch(cropControllerProvider);
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        title: TitleWithButton(
          title: LocaleKeys.crop_title.tr(),
          icon: Icons.home_outlined,
          onButtonClick: () => showDialog<String>(
            context: context,
            builder: (final BuildContext context) => ConfirmationDialog(
                onConfirm: () {
                  GoRouter.of(context).go(NavigationServiceRoutes.home);
                },
                onCancel: () {
                  Navigator.pop(context);
                },
                header: LocaleKeys.crop_discard_dialog_header.tr(),
                notificationText: LocaleKeys.crop_discard_dialog_body.tr()),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ScanCrop(imagePaths: imagePaths),
        ],
      ),
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: LocaleKeys.crop_navigation_retake_photo.tr(),
            buttonIcon: Icons.flip_camera_ios_outlined,
            onPressed: () => showDialog<String>(
              context: context,
              builder: (final BuildContext context) => ConfirmationDialog(
                onConfirm: () {
                  controller.removeLastImageFromImagePaths();
                  controller.goToPage(Uri(
                      path: NavigationServiceRoutes.scan,
                      queryParameters: <String, List<String>>{
                        'path': controller.getImagePaths(),
                      }));
                  controller.clear();
                },
                onCancel: () {
                  controller.goBack();
                },
                header: LocaleKeys.crop_retake_dialog_header.tr(),
                notificationText: LocaleKeys.crop_retake_dialog_body.tr(),
              ),
            ),
          ),
          NavigationButton(
            buttonText: LocaleKeys.crop_navigation_keep_scanning.tr(),
            buttonIcon: Icons.arrow_forward_outlined,
            onPressed: () {
              controller.goToPage(Uri(
                  path: NavigationServiceRoutes.scan,
                  queryParameters: <String, List<String>>{
                    'path': controller.getImagePaths(),
                  }));
              controller.clear();
            },
          ),
          Semantics(
            identifier: 'save_document_button',
            child: NavigationButton(
              buttonText: LocaleKeys.crop_navigation_save_document.tr(),
              buttonIcon: Icons.save_outlined,
              onPressed: () {
                controller.goToPage(Uri(
                    path: NavigationServiceRoutes.save,
                    queryParameters: <String, List<String>>{
                      'path': controller.getImagePaths(),
                    }));
                controller.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
