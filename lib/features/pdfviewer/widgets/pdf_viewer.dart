import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  final String path;
  final PdfViewerController pdfViewerController;
  final bool showScrollHead;



  const PdfViewer({
    super.key,
    required this.path,
    required this.pdfViewerController,
    required this.showScrollHead,
  });

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<File>(
          future: _getFile(path),
          builder:
              (final BuildContext context, final AsyncSnapshot<File> snapshot) {
            if (snapshot.hasData) {
              return SfPdfViewer.file(
                snapshot.data!,
                controller: pdfViewerController,
                canShowScrollHead: showScrollHead,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            // Display a loading indicator while fetching the file
            return const Center(child: CircularProgressIndicator());
          },
        );
  }

  Future<File> _getFile(final String path) async {
    return File(path);
  }
}
