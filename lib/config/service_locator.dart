import 'package:get_it/get_it.dart';
import 'package:nodocs/features/filesystem/controller/file_system_contoller/file_system_contoller.dart';
import 'package:nodocs/features/filesystem/controller/file_system_contoller/implementation/file_system_controller_impl.dart';
import 'package:nodocs/features/filesystem/model/file_system_access.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FileSystemAccess>(FileSystemAccess());
  getIt.registerSingleton<FileSystemController>(FileSystemControllerImpl(getIt<FileSystemAccess>()));
}