// Mocks generated by Mockito 5.4.4 from annotations
// in nodocs/test/unit/features/filesystem/services/file_picker/implementation/file_picker_service_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:file_picker/file_picker.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nodocs/features/filesystem/services/file_picker/file_picker_adapter.dart'
    as _i2;

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

/// A class which mocks [FilePickerAdapter].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilePickerAdapter extends _i1.Mock implements _i2.FilePickerAdapter {
  MockFilePickerAdapter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.FilePickerResult?> pickFiles({
    required _i4.FileType? type,
    List<String>? allowedExtensions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickFiles,
          [],
          {
            #type: type,
            #allowedExtensions: allowedExtensions,
          },
        ),
        returnValue: _i3.Future<_i4.FilePickerResult?>.value(),
      ) as _i3.Future<_i4.FilePickerResult?>);
}
