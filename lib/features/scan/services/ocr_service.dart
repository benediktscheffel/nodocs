import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class OcrService {
  Future<Uint8List> ocrDocument(final pw.Document pdf, final Logger log);
}