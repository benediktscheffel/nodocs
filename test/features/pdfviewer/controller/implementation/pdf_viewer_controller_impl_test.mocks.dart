// Mocks generated by Mockito 5.4.4 from annotations
// in nodocs/test/features/pdfviewer/controller/implementation/pdf_viewer_controller_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter/material.dart' as _i3;
import 'package:fpdart/fpdart.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;
import 'package:nodocs/features/navigation/navigation_service.dart' as _i6;
import 'package:nodocs/features/pdfviewer/services/pdf_search_service.dart'
    as _i9;
import 'package:nodocs/features/pdfviewer/widgets/pdf_search_toolbar.dart'
    as _i10;
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart'
    as _i4;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart' as _i2;

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

class _FakePdfViewerController_0 extends _i1.SmartFake
    implements _i2.PdfViewerController {
  _FakePdfViewerController_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGlobalKey_1<T extends _i3.State<_i3.StatefulWidget>>
    extends _i1.SmartFake implements _i3.GlobalKey<T> {
  _FakeGlobalKey_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PersistenceService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPersistenceService extends _i1.Mock
    implements _i4.PersistenceService {
  MockPersistenceService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteTagFromFile(
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteTag(String? tagName) => (super.noSuchMethod(
        Invocation.method(
          #deleteTag,
          [tagName],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteFile(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #deleteFile,
          [filePath],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> addTagToFile(
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<int> insertTag(String? tagName) => (super.noSuchMethod(
        Invocation.method(
          #insertTag,
          [tagName],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<int> insertFile(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #insertFile,
          [filePath],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<void> updateFile(
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> addTagsToFile(
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  List<(String, bool)> loadTags(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #loadTags,
          [filePath],
        ),
        returnValue: <(String, bool)>[],
      ) as List<(String, bool)>);

  @override
  _i5.Future<void> deleteTagsFromFile(
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> updateFilesInCollection(
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  List<String> loadAllTags() => (super.noSuchMethod(
        Invocation.method(
          #loadAllTags,
          [],
        ),
        returnValue: <String>[],
      ) as List<String>);
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

  @override
  _i7.TaskEither<Object, _i7.Option<T>> showPopup<T>(
    _i3.Widget? popup, {
    bool? canBePoppedViaBackGesture,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showPopup,
          [popup],
          {#canBePoppedViaBackGesture: canBePoppedViaBackGesture},
        ),
        returnValue: _i8.dummyValue<_i7.TaskEither<Object, _i7.Option<T>>>(
          this,
          Invocation.method(
            #showPopup,
            [popup],
            {#canBePoppedViaBackGesture: canBePoppedViaBackGesture},
          ),
        ),
      ) as _i7.TaskEither<Object, _i7.Option<T>>);
}

/// A class which mocks [PdfSearchService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPdfSearchService extends _i1.Mock implements _i9.PdfSearchService {
  MockPdfSearchService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PdfViewerController get controller => (super.noSuchMethod(
        Invocation.getter(#controller),
        returnValue: _FakePdfViewerController_0(
          this,
          Invocation.getter(#controller),
        ),
      ) as _i2.PdfViewerController);

  @override
  set controller(_i2.PdfViewerController? _controller) => super.noSuchMethod(
        Invocation.setter(
          #controller,
          _controller,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set historyEntry(_i3.LocalHistoryEntry? _historyEntry) => super.noSuchMethod(
        Invocation.setter(
          #historyEntry,
          _historyEntry,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set textSearchKey(
          _i3.GlobalKey<_i10.PdfSearchToolbarState>? _textSearchKey) =>
      super.noSuchMethod(
        Invocation.setter(
          #textSearchKey,
          _textSearchKey,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.GlobalKey<_i10.PdfSearchToolbarState> get key => (super.noSuchMethod(
        Invocation.getter(#key),
        returnValue: _FakeGlobalKey_1<_i10.PdfSearchToolbarState>(
          this,
          Invocation.getter(#key),
        ),
      ) as _i3.GlobalKey<_i10.PdfSearchToolbarState>);

  @override
  _i2.PdfViewerController get pdfViewerController => (super.noSuchMethod(
        Invocation.getter(#pdfViewerController),
        returnValue: _FakePdfViewerController_0(
          this,
          Invocation.getter(#pdfViewerController),
        ),
      ) as _i2.PdfViewerController);

  @override
  void ensureHistoryEntry(_i3.BuildContext? context) => super.noSuchMethod(
        Invocation.method(
          #ensureHistoryEntry,
          [context],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void showToast() => super.noSuchMethod(
        Invocation.method(
          #showToast,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void initKey() => super.noSuchMethod(
        Invocation.method(
          #initKey,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void disposeKey() => super.noSuchMethod(
        Invocation.method(
          #disposeKey,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
