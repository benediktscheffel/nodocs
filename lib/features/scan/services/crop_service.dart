import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

abstract class CropService {
  Future<CroppedFile?> cropImage(final ThemeData theme, final XFile? pickedFile,
      final BuildContext context);
}
