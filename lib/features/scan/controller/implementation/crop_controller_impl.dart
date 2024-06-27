
import 'package:logger/logger.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/crop_controller.dart';
import 'package:nodocs/features/scan/model/crop_model.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crop_controller_impl.g.dart';

@riverpod
class CropControllerImpl extends _$CropControllerImpl implements CropController {
  final Logger _log = getLogger();

  @override
  CropModel build({
    required final NavigationService navigationService,
  }) {
    return const CropModel(imagePaths: <String>[]);
  }

  @override
  void goToPage(final Uri uri) {
    _log.i("Navigating to: ${uri.toString()}");
    navigationService.push(uri.toString());
  }

  @override
  void goBack() {
    _log.i("Going back");
    navigationService.pop();
  }

  @override
  List<String> removeFromImagePaths(final List<String> imagePaths) {
    _log.i("removing image: ${imagePaths.last}");
    return ImageService.removeFromImagePaths(imagePaths);
  }
}