import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodocs/gen/locale_keys.g.dart';

class CropService {
  static Future<CroppedFile?> cropImage(final ThemeData theme, final XFile? pickedFile, final BuildContext context) async {
    if (pickedFile != null) {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: <PlatformUiSettings>[
          AndroidUiSettings(
              toolbarTitle: LocaleKeys.crop_service_cropper.tr(),
              toolbarColor: theme.colorScheme.secondary,
              toolbarWidgetColor: theme.colorScheme.onSecondary,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: LocaleKeys.crop_service_cropper.tr(),
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        return croppedFile;
      }
    }
    return null;
  }
}