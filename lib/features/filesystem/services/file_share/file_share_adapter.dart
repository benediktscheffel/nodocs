import 'package:share_plus/share_plus.dart';

abstract class FileShareAdapter {
  Future<ShareResult> shareFile(final String path);
}