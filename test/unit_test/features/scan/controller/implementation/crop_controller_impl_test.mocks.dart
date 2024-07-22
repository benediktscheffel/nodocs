// Mocks generated by Mockito 5.4.4 from annotations
// in nodocs/test/unit/features/scan/controller/implementation/crop_controller_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter/material.dart' as _i6;
import 'package:image_cropper/image_cropper.dart' as _i5;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;
import 'package:nodocs/features/navigation/navigation_service.dart' as _i2;
import 'package:nodocs/features/scan/services/crop_service.dart' as _i3;
import 'package:nodocs/features/scan/services/image_service.dart' as _i8;

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

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i2.NavigationService {
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

/// A class which mocks [CropService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCropService extends _i1.Mock implements _i3.CropService {
  MockCropService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.CroppedFile?> cropImage(
    _i6.ThemeData? theme,
    _i7.XFile? pickedFile,
    _i6.BuildContext? context,
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
        returnValue: _i4.Future<_i5.CroppedFile?>.value(),
      ) as _i4.Future<_i5.CroppedFile?>);
}

/// A class which mocks [ImageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageService extends _i1.Mock implements _i8.ImageService {
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
        returnValue: _i9.dummyValue<String>(
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
