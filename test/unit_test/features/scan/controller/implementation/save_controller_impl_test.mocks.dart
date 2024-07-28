// Mocks generated by Mockito 5.4.4 from annotations
// in nodocs/test/unit_test/features/scan/controller/implementation/save_controller_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:io' as _i5;
import 'dart:typed_data' as _i9;

import 'package:flutter/material.dart' as _i14;
import 'package:image_cropper/image_cropper.dart' as _i13;
import 'package:image_picker/image_picker.dart' as _i15;
import 'package:logger/logger.dart' as _i11;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:nodocs/features/filesystem/services/file_system_access/file_system_service.dart'
    as _i3;
import 'package:nodocs/features/navigation/navigation_service.dart' as _i7;
import 'package:nodocs/features/scan/model/collection_dropdown_model.dart'
    as _i2;
import 'package:nodocs/features/scan/services/carousel_service.dart' as _i17;
import 'package:nodocs/features/scan/services/collection_dropdown_service.dart'
    as _i19;
import 'package:nodocs/features/scan/services/crop_service.dart' as _i12;
import 'package:nodocs/features/scan/services/image_service.dart' as _i16;
import 'package:nodocs/features/scan/services/ocr_service.dart' as _i8;
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart'
    as _i18;
import 'package:pdf/widgets.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCollectionDropdownModel_0 extends _i1.SmartFake
    implements _i2.CollectionDropdownModel {
  _FakeCollectionDropdownModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FileSystemService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFileSystemService extends _i1.Mock implements _i3.FileSystemService {
  MockFileSystemService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.Directory>? createCollection(String? name) =>
      (super.noSuchMethod(Invocation.method(
        #createCollection,
        [name],
      )) as _i4.Future<_i5.Directory>?);

  @override
  _i4.Future<_i5.FileSystemEntity>? deleteCollectionOrFile(String? path) =>
      (super.noSuchMethod(Invocation.method(
        #deleteCollectionOrFile,
        [path],
      )) as _i4.Future<_i5.FileSystemEntity>?);

  @override
  _i4.Future<_i5.FileSystemEntity>? renameCollectionOrFile(
    String? oldPath,
    String? newName,
  ) =>
      (super.noSuchMethod(Invocation.method(
        #renameCollectionOrFile,
        [
          oldPath,
          newName,
        ],
      )) as _i4.Future<_i5.FileSystemEntity>?);

  @override
  String getRootDirectory() => (super.noSuchMethod(
        Invocation.method(
          #getRootDirectory,
          [],
        ),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.method(
            #getRootDirectory,
            [],
          ),
        ),
      ) as String);

  @override
  _i4.Future<int> getCountOfTextOccurrencesInPdf(
    String? path,
    String? text,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCountOfTextOccurrencesInPdf,
          [
            path,
            text,
          ],
        ),
        returnValue: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);

  @override
  _i4.Future<List<String>> getAllPdfPaths() => (super.noSuchMethod(
        Invocation.method(
          #getAllPdfPaths,
          [],
        ),
        returnValue: _i4.Future<List<String>>.value(<String>[]),
      ) as _i4.Future<List<String>>);
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i7.NavigationService {
  MockNavigationService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void goBack({Uri? fallbackUri}) => super.noSuchMethod(
        Invocation.method(
          #goBack,
          [],
          {#fallbackUri: fallbackUri},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void pop<T>({T? data}) => super.noSuchMethod(
        Invocation.method(
          #pop,
          [],
          {#data: data},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void push(String? uri) => super.noSuchMethod(
        Invocation.method(
          #push,
          [uri],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void replaceWith(Uri? uri) => super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [uri],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void replaceWithNamed(Uri? uri) => super.noSuchMethod(
        Invocation.method(
          #replaceWithNamed,
          [uri],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearStack() => super.noSuchMethod(
        Invocation.method(
          #clearStack,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [OcrService].
///
/// See the documentation for Mockito's code generation for more information.
class MockOcrService extends _i1.Mock implements _i8.OcrService {
  MockOcrService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i9.Uint8List> ocrDocument(
    _i10.Document? pdf,
    _i11.Logger? log,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #ocrDocument,
          [
            pdf,
            log,
          ],
        ),
        returnValue: _i4.Future<_i9.Uint8List>.value(_i9.Uint8List(0)),
      ) as _i4.Future<_i9.Uint8List>);
}

/// A class which mocks [CropService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCropService extends _i1.Mock implements _i12.CropService {
  MockCropService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i13.CroppedFile?> cropImage(
    _i14.ThemeData? theme,
    _i15.XFile? pickedFile,
    _i14.BuildContext? context,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #cropImage,
          [
            theme,
            pickedFile,
            context,
          ],
        ),
        returnValue: _i4.Future<_i13.CroppedFile?>.value(),
      ) as _i4.Future<_i13.CroppedFile?>);
}

/// A class which mocks [ImageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageService extends _i1.Mock implements _i16.ImageService {
  MockImageService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<String> removeFromImagePaths(List<String>? imagePaths) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFromImagePaths,
          [imagePaths],
        ),
        returnValue: <String>[],
      ) as List<String>);

  @override
  List<String> addToImagePaths(
    List<String>? imagePaths,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addToImagePaths,
          [
            imagePaths,
            path,
          ],
        ),
        returnValue: <String>[],
      ) as List<String>);

  @override
  String getLatestImagePath(List<String>? imagePaths) => (super.noSuchMethod(
        Invocation.method(
          #getLatestImagePath,
          [imagePaths],
        ),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.method(
            #getLatestImagePath,
            [imagePaths],
          ),
        ),
      ) as String);

  @override
  List<String> replaceImagePath(
    String? oldPath,
    String? newPath,
    List<String>? imagePaths,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceImagePath,
          [
            oldPath,
            newPath,
            imagePaths,
          ],
        ),
        returnValue: <String>[],
      ) as List<String>);
}

/// A class which mocks [CarouselService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCarouselService extends _i1.Mock implements _i17.CarouselService {
  MockCarouselService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i14.Widget> buildImageWidgets(List<String>? imagePaths) =>
      (super.noSuchMethod(
        Invocation.method(
          #buildImageWidgets,
          [imagePaths],
        ),
        returnValue: <_i14.Widget>[],
      ) as List<_i14.Widget>);
}

/// A class which mocks [PersistenceService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPersistenceService extends _i1.Mock
    implements _i18.PersistenceService {
  MockPersistenceService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteTagFromFile(
    String? filePath,
    String? tagName,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteTagFromFile,
          [
            filePath,
            tagName,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteTag(String? tagName) => (super.noSuchMethod(
        Invocation.method(
          #deleteTag,
          [tagName],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteFile(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #deleteFile,
          [filePath],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> addTagToFile(
    String? filePath,
    String? tagName,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTagToFile,
          [
            filePath,
            tagName,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<int> insertTag(String? tagName) => (super.noSuchMethod(
        Invocation.method(
          #insertTag,
          [tagName],
        ),
        returnValue: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);

  @override
  _i4.Future<int> insertFile(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #insertFile,
          [filePath],
        ),
        returnValue: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);

  @override
  _i4.Future<void> updateFile(
    String? oldPath,
    String? newPath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateFile,
          [
            oldPath,
            newPath,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> addTagsToFile(
    String? filePath,
    List<String>? tags,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTagsToFile,
          [
            filePath,
            tags,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  List<(String, bool)> loadTags(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #loadTags,
          [filePath],
        ),
        returnValue: <(String, bool)>[],
      ) as List<(String, bool)>);

  @override
  _i4.Future<void> deleteTagsFromFile(
    String? filePath,
    List<String>? tags,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteTagsFromFile,
          [
            filePath,
            tags,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updateFilesInCollection(
    String? oldPath,
    String? newPath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateFilesInCollection,
          [
            oldPath,
            newPath,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  List<String> loadAllTags() => (super.noSuchMethod(
        Invocation.method(
          #loadAllTags,
          [],
        ),
        returnValue: <String>[],
      ) as List<String>);
}

/// A class which mocks [CollectionDropdownService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCollectionDropdownService extends _i1.Mock
    implements _i19.CollectionDropdownService {
  MockCollectionDropdownService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CollectionDropdownModel getCollectionDropdown() => (super.noSuchMethod(
        Invocation.method(
          #getCollectionDropdown,
          [],
        ),
        returnValue: _FakeCollectionDropdownModel_0(
          this,
          Invocation.method(
            #getCollectionDropdown,
            [],
          ),
        ),
      ) as _i2.CollectionDropdownModel);

  @override
  _i2.CollectionDropdownModel openCollection(String? path) =>
      (super.noSuchMethod(
        Invocation.method(
          #openCollection,
          [path],
        ),
        returnValue: _FakeCollectionDropdownModel_0(
          this,
          Invocation.method(
            #openCollection,
            [path],
          ),
        ),
      ) as _i2.CollectionDropdownModel);

  @override
  _i2.CollectionDropdownModel closeCollection(String? path) =>
      (super.noSuchMethod(
        Invocation.method(
          #closeCollection,
          [path],
        ),
        returnValue: _FakeCollectionDropdownModel_0(
          this,
          Invocation.method(
            #closeCollection,
            [path],
          ),
        ),
      ) as _i2.CollectionDropdownModel);
}
