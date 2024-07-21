import 'package:nodocs/features/filesystem/services/file_share/file_share_adapter.dart';
import 'package:share_plus/share_plus.dart';

class FileShareAdapterImpl implements FileShareAdapter {
  @override
  Future<ShareResult> shareFile(final String path) async {
    return Share.shareXFiles(<XFile>[XFile(path)]);
  }
}
