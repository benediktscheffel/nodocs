import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nodocs/features/filesystem/services/file_picker/file_picker_adapter.dart';
import 'package:nodocs/features/filesystem/services/file_picker/file_picker_service.dart';
import 'package:nodocs/features/filesystem/services/file_picker/implementation/file_picker_service_impl.dart';

import 'file_picker_service_impl_test.mocks.dart';

@GenerateMocks(<Type>[FilePickerAdapter])
class GeneratedMocks {}

void main() {
  late MockFilePickerAdapter mockFilePickerAdapter;
  final List<File> tempFiles = <File>[];

  setUp(() {
    mockFilePickerAdapter = MockFilePickerAdapter();
  });

  tearDown(() async {
    for (final File file in tempFiles) {
      try {
        await file.delete();
      } catch (e) {
      // ignore
      }
    }
  });

  FilePickerService createFileShareService() {
    return FilePickerServiceImpl(mockFilePickerAdapter);
  }

  test('FilePickerService should return null if the user cancels', () async {
    // Setup
    when(mockFilePickerAdapter.pickFiles(
            type: FileType.custom, allowedExtensions: <String>['pdf']))
        .thenAnswer((final _) async => null);
    final FilePickerService filePickerService = createFileShareService();

    // Execute
    File? file = await filePickerService.pickFile('collectionPath');

    // Verify
    verify(mockFilePickerAdapter.pickFiles(
        type: FileType.custom, allowedExtensions: <String>['pdf'])).called(1);
    expect(file, null);
  });

  test('FilePickerService should create a new File when the user selects it',
      () async {
    // Setup
    final String tempFilePath = '${Directory.systemTemp.path}/file.pdf';
    final File tempFile = File(tempFilePath)..createSync();
    tempFiles.add(tempFile); // Add the temporary file to the list for cleanup

    FilePickerResult filePickerResult = FilePickerResult(<PlatformFile>[
      PlatformFile(name: 'file.pdf', path: tempFilePath, size: 0)
    ]);
    when(mockFilePickerAdapter.pickFiles(
            type: FileType.custom, allowedExtensions: <String>['pdf']))
        .thenAnswer((final _) async => filePickerResult);

    final FilePickerService filePickerService = createFileShareService();

    // Execute
    File? file = await filePickerService.pickFile(Directory.systemTemp.path);

    // Verify
    verify(mockFilePickerAdapter.pickFiles(
        type: FileType.custom, allowedExtensions: <String>['pdf'])).called(1);
    expect(file, isNotNull);
    expect(file!.path, tempFilePath);
  });
}
