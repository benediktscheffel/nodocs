// Mocks generated by Mockito 5.4.4 from annotations
// in nodocs/test/unit/features/search/controller/implementation/search_result_controller_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:io' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:nodocs/features/filesystem/services/file_system_access/file_system_service.dart'
    as _i2;
import 'package:nodocs/features/navigation/navigation_service.dart' as _i6;
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart'
    as _i7;

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

/// A class which mocks [FileSystemService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFileSystemService extends _i1.Mock implements _i2.FileSystemService {
  MockFileSystemService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Directory>? createCollection(String? name) =>
      (super.noSuchMethod(Invocation.method(
        #createCollection,
        [name],
      )) as _i3.Future<_i4.Directory>?);

  @override
  _i3.Future<_i4.FileSystemEntity>? deleteCollectionOrFile(String? path) =>
      (super.noSuchMethod(Invocation.method(
        #deleteCollectionOrFile,
        [path],
      )) as _i3.Future<_i4.FileSystemEntity>?);

  @override
  _i3.Future<_i4.FileSystemEntity>? renameCollectionOrFile(
    String? oldPath,
    String? newName,
  ) =>
      (super.noSuchMethod(Invocation.method(
        #renameCollectionOrFile,
        [
          oldPath,
          newName,
        ],
      )) as _i3.Future<_i4.FileSystemEntity>?);

  @override
  String getRootDirectory() => (super.noSuchMethod(
        Invocation.method(
          #getRootDirectory,
          [],
        ),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #getRootDirectory,
            [],
          ),
        ),
      ) as String);

  @override
  _i3.Future<int> getCountOfTextOccurrencesInPdf(
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
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);

  @override
  _i3.Future<List<String>> getAllPdfPaths() => (super.noSuchMethod(
        Invocation.method(
          #getAllPdfPaths,
          [],
        ),
        returnValue: _i3.Future<List<String>>.value(<String>[]),
      ) as _i3.Future<List<String>>);
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i6.NavigationService {
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
}

/// A class which mocks [PersistenceService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPersistenceService extends _i1.Mock
    implements _i7.PersistenceService {
  MockPersistenceService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> deleteTagFromFile(
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
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> deleteTag(String? tagName) => (super.noSuchMethod(
        Invocation.method(
          #deleteTag,
          [tagName],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> deleteFile(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #deleteFile,
          [filePath],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> addTagToFile(
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
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<int> insertTag(String? tagName) => (super.noSuchMethod(
        Invocation.method(
          #insertTag,
          [tagName],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);

  @override
  _i3.Future<int> insertFile(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #insertFile,
          [filePath],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);

  @override
  _i3.Future<void> updateFile(
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
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> addTagsToFile(
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
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  List<(String, bool)> loadTags(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #loadTags,
          [filePath],
        ),
        returnValue: <(String, bool)>[],
      ) as List<(String, bool)>);

  @override
  _i3.Future<void> deleteTagsFromFile(
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
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> updateFilesInCollection(
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
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  List<String> loadAllTags() => (super.noSuchMethod(
        Invocation.method(
          #loadAllTags,
          [],
        ),
        returnValue: <String>[],
      ) as List<String>);
}
