import 'package:nodocs/features/filesystem/controller/home_contoller.dart';
import 'package:nodocs/features/filesystem/controller/implementation/home_controller_impl.dart';
import 'package:nodocs/features/filesystem/model/home_model/home_model.dart';
import 'package:nodocs/features/filesystem/services/file_system_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

@riverpod
FileSystemServiceImpl fileSystemServiceImpl(final FileSystemServiceImplRef ref) =>
    FileSystemServiceImpl();

@riverpod
HomeController homeController(final HomeControllerRef ref) => ref.watch(
      homeControllerImplProvider(
        fileSystemService: ref.watch(fileSystemServiceImplProvider)
      ).notifier,
    );

@riverpod
HomeModel homeModel(final HomeModelRef ref) => ref.watch(
      homeControllerImplProvider(
        fileSystemService: ref.watch(fileSystemServiceImplProvider)
      ),
    );
