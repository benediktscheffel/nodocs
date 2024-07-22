import 'package:get_it/get_it.dart';
import 'package:nodocs/features/filesystem/controller/home_contoller.dart';
import 'package:nodocs/features/filesystem/controller/implementation/home_controller_impl.dart';
import 'package:nodocs/features/filesystem/services/file_picker/file_picker_service.dart';
import 'package:nodocs/features/filesystem/services/file_picker/implementation/file_picker_adapter_impl.dart';
import 'package:nodocs/features/filesystem/services/file_picker/implementation/file_picker_service_impl.dart';
import 'package:nodocs/features/filesystem/services/file_share/file_share_service.dart';
import 'package:nodocs/features/filesystem/services/file_share/implementation/file_share_adapter_impl.dart';
import 'package:nodocs/features/filesystem/services/file_share/implementation/file_share_service_impl.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/file_system_service.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/implementation/file_system_service_impl.dart';
import 'package:nodocs/features/scan/services/carousel_service.dart';
import 'package:nodocs/features/scan/services/crop_service.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/features/scan/services/implementation/carousel_service_impl.dart';
import 'package:nodocs/features/scan/services/implementation/crop_service_impl.dart';
import 'package:nodocs/features/scan/services/implementation/image_service_impl.dart';
import 'package:nodocs/features/settings/services/language/implementation/language_evaluation_service_impl.dart';
import 'package:nodocs/features/settings/services/language/language_evaluation_service.dart';
import 'package:nodocs/features/tags/services/persistence/isar/isar_persistence_service.dart';
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FileSystemService>(FileSystemServiceImpl());
  getIt.registerSingleton<HomeController>(HomeControllerImpl());
  getIt.registerSingleton<PersistenceService>(IsarPersistenceService());
  getIt.registerSingleton<FileShareService>(
      FileShareServiceImpl(FileShareAdapterImpl()));
  getIt.registerSingleton<FilePickerService>(
      FilePickerServiceImpl(FilePickerAdapterImpl()));
  getIt.registerSingleton<LanguageEvaluationService>(
      LanguageEvaluationServiceImpl());
  getIt.registerSingleton<CropService>(CropServiceImpl());
  getIt.registerSingleton<ImageService>(ImageServiceImpl());
  getIt.registerSingleton<CarouselService>(CarouselServiceImpl());
}
