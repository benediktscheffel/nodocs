import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nodocs/feature_pdfviewer/widgets/pdf_search_toolbar.dart';
import 'package:path/path.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({super.key, required this.path});

  final String path;
  @override
  CustomSearchPdfViewerState createState() => CustomSearchPdfViewerState();
}
class CustomSearchPdfViewerState extends State<PdfViewer> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  final GlobalKey<PdfSearchToolbarState> _textSearchKey = GlobalKey();
  late bool _showToolbar;
  late bool _showScrollHead;

  LocalHistoryEntry? _historyEntry;

  @override
  void initState() {
    _showToolbar = false;
    _showScrollHead = true;
    super.initState();
  }

  void _ensureHistoryEntry(final BuildContext context) {
    if (_historyEntry == null) {
      final ModalRoute<dynamic>? route = ModalRoute.of(context);
      if (route != null) {
        _historyEntry = LocalHistoryEntry(onRemove: _handleHistoryEntryRemoved);
        route.addLocalHistoryEntry(_historyEntry!);
      }
    }
  }

  void _handleHistoryEntryRemoved() {
    _textSearchKey.currentState?.clearSearch();
    setState(() {
      _showToolbar = false;
    });
    _historyEntry = null;
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: _showToolbar
          ? AppBar(
        flexibleSpace: SafeArea(
          child: PdfSearchToolbar(
            key: _textSearchKey,
            showTooltip: true,
            controller: _pdfViewerController,
            onTap: (final Object toolbarItem) async {
              if (toolbarItem.toString() == 'Cancel Search') {
                setState(() {
                  _showToolbar = false;
                  _showScrollHead = true;
                  if (Navigator.canPop(context)) {
                    Navigator.maybePop(context);
                  }
                });
              }
              if (toolbarItem.toString() == 'noResultFound') {
                setState(() {
                  _textSearchKey.currentState?.showToast = true;
                });
                await Future<dynamic>.delayed(const Duration(seconds: 1));
                setState(() {
                  _textSearchKey.currentState?.showToast = false;
                });
              }
            },
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFAFAFA),
      )
          : AppBar(
        title: Text(
          widget.path.split('/').last,
          style: const TextStyle(color: Colors.black87),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black87,
            ),
            onPressed: () {
              setState(() {
                _showScrollHead = false;
                _showToolbar = true;
                _ensureHistoryEntry(context);
              });
            },
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFAFAFA),
      ),
      body: Stack(
        children: <Widget>[
          FutureBuilder<File>(
            future: _getFile(widget.path),
            builder: (final BuildContext context, final AsyncSnapshot<File> snapshot) {
              if (snapshot.hasData) {
                return SfPdfViewer.file(snapshot.data!, controller: _pdfViewerController, canShowScrollHead: _showScrollHead,);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              // Display a loading indicator while fetching the file
              return const Center(child: CircularProgressIndicator());
            },
          ),
          Visibility(
            visible: _textSearchKey.currentState?.showToast ?? false,
            child: Align(
              alignment: Alignment.center,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding:
                    const EdgeInsets.only(left: 15, top: 7, right: 15, bottom: 7),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: const Text(
                      'No result',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<File> _getFile(final String path) async {
    const String devicePath = '/data/data/com.example.nodocs/files/';
    return File(join(devicePath, path));
  }
}