import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nodocs/features/filesystem/services/file_share/file_share_adapter.dart';
import 'package:nodocs/features/filesystem/services/file_share/file_share_service.dart';
import 'package:nodocs/features/filesystem/services/file_share/implementation/file_share_service_impl.dart';
import 'package:share_plus/share_plus.dart';

import 'file_share_service_impl_test.mocks.dart';

@GenerateMocks(<Type>[FileShareAdapter])
class GeneratedMocks {}

void main() {
  late MockFileShareAdapter mockFileShareAdapter;

  setUp(() {
    mockFileShareAdapter = MockFileShareAdapter();
  });

  FileShareService createFileShareService() {
    return FileShareServiceImpl(mockFileShareAdapter);
  }

  test('FileShareService should share a file', () async {
    // Setup
    when(mockFileShareAdapter.shareFile('path')).thenAnswer(
        (final _) async => const ShareResult('id', ShareResultStatus.success));

    final FileShareService fileShareService = createFileShareService();

    // Execute
    final bool result = await fileShareService.shareFile('path');

    // Verify
    verify(mockFileShareAdapter.shareFile('path')).called(1);
    expect(result, true);
  });

  test('FileShareService should return false if sharing a file fails',
      () async {
    // Setup
    when(mockFileShareAdapter.shareFile('path')).thenAnswer((final _) async =>
        const ShareResult('id', ShareResultStatus.unavailable));

    final FileShareService fileShareService = createFileShareService();

    // Execute
    final bool result = await fileShareService.shareFile('path');

    // Verify
    verify(mockFileShareAdapter.shareFile('path')).called(1);
    expect(result, false);
  });
}
