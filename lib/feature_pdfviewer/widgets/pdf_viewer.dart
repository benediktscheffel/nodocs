import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatefulWidget {
  final String path;

  const PDFViewer({super.key, required this.path});

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: FutureBuilder<File>(
        future: _getFile(widget.path),
        builder: (final BuildContext context, final AsyncSnapshot<File> snapshot) {
          if (snapshot.hasData) {
            return SfPdfViewer.file(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          // Display a loading indicator while fetching the file
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<File> _getFile(final String path) async {
    const String devicePath = '/data/data/com.example.nodocs/files/';
    return File(join(devicePath, path));
  }
}
