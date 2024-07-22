import 'package:logger/logger.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/scan_controller.dart';
import 'package:nodocs/features/scan/model/scan_model.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_controller_impl.g.dart';

@riverpod
class ScanControllerImpl extends _$ScanControllerImpl
    implements ScanController {
  final Logger _log = getLogger();

  @override
  ScanModel build({
    required final NavigationService navigationService,
    required final ImageService imageService,
  }) {
    return const ScanModel();
  }

  @override
  List<String> addToImagePaths(
      final List<String> imagePaths, final String path) {
    _log.i("adding image: $path");
    return imageService.addToImagePaths(imagePaths, path);
  }

  @override
  List<String> removeFromImagePaths(final List<String> imagePaths) {
    _log.i("removing image");
    return imageService.removeFromImagePaths(imagePaths);
  }

  @override
  String getLatestImagePath(final List<String> imagePaths) {
    _log.i("getting image");
    return imageService.getLatestImagePath(imagePaths);
  }

  @override
  int getScanCounter(final List<String> imagePaths) {
    return imagePaths.length;
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
  void goBackHome() {
    navigationService.clearStack();
  }
}
