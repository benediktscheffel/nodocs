import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nodocs/features/pdfviewer/widgets/pdf_search_toolbar.dart';
import 'package:nodocs/features/tags/widgets/tag_dialog.dart';
import 'package:nodocs/go_router.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';
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
    ThemeData theme = Theme.of(context);
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
        backgroundColor: theme.colorScheme.secondary,
      )
          : AppBar(
        title: Text(
          widget.path.split('/').last.replaceAll('.pdf', ''),
          style: TextStyle(color: theme.colorScheme.onSecondary),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.secondary,
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
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: 'Edit Tags',
            buttonIcon: Icons.edit_outlined,
            onPressed: () => showDialog<String>(
              context: context,
              builder: (final BuildContext context) =>
                const TagDialog(),
            ),
          ),
          NavigationButton(
            buttonText: 'Home',
            buttonIcon: Icons.home_outlined,
            onPressed: () {
              const HomeRoute().go(context);
            },
          ),
          NavigationButton(
            buttonText: 'Search',
            buttonIcon: Icons.search,
            onPressed: () {
              setState(() {
                _showScrollHead = false;
                _showToolbar = true;
                _ensureHistoryEntry(context);
              });
            }),
        ],
      )
    );
  }
  Future<File> _getFile(final String path) async {
    return File(path);
  }
}