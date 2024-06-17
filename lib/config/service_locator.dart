import 'package:get_it/get_it.dart';
import 'package:nodocs/features/filesystem/controller/home_contoller.dart';
import 'package:nodocs/features/filesystem/controller/implementation/home_controller_impl.dart';
import 'package:nodocs/features/filesystem/services/file_system_service.dart';
import 'package:nodocs/features/filesystem/services/file_system_service_impl.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FileSystemService>(FileSystemServiceImpl());
  getIt.registerSingleton<HomeController>(HomeControllerImpl());
}