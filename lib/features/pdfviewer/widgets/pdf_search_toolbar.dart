import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

typedef SearchTapCallback = void Function(Object item);

class PdfSearchToolbar extends StatefulWidget {
  const PdfSearchToolbar({
    super.key,
    required this.controller,
    required this.onTap,
    required this.goBack,
    this.showTooltip = true,
  });

  final bool showTooltip;
  final PdfViewerController? controller;
  final SearchTapCallback? onTap;
  final VoidCallback goBack;

  @override
  State<PdfSearchToolbar> createState() => PdfSearchToolbarState();
}

class PdfSearchToolbarState extends State<PdfSearchToolbar> {
  bool _isSearchInitiated = false;

  bool showToast = false;

  final TextEditingController _editingController = TextEditingController();

  late PdfTextSearchResult _pdfTextSearchResult;

  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode?.requestFocus();
    _pdfTextSearchResult = PdfTextSearchResult();
  }

  @override
  void dispose() {
    focusNode?.dispose();
    _pdfTextSearchResult.removeListener(() {});
    _editingController.dispose();
    _pdfTextSearchResult.dispose();
    super.dispose();
  }

  void clearSearch() {
    _isSearchInitiated = false;
    _pdfTextSearchResult.clear();
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.onPrimary,
              size: 24,
            ),
            onPressed: () {
              widget.onTap?.call('Cancel Search');
              clearSearch();
              _pdfTextSearchResult.clear();
            },
          ),
        ),
        Flexible(
          child: TextFormField(
            style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 16),
            enableInteractiveSelection: false,
            focusNode: focusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            controller: _editingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: LocaleKeys.pdf_viewer_search_toolbar_hint_text.tr(),
              hintStyle: TextStyle(
                  color: theme.colorScheme.onPrimary.withOpacity(0.34)),
            ),
            onChanged: (final _) async {
              setState(() {});
            },
            onFieldSubmitted: (final String text) {
              _isSearchInitiated = true;
              if (text.isNotEmpty) {
                _pdfTextSearchResult = widget.controller!.searchText(text);
                _pdfTextSearchResult.addListener(() {
                  if (super.mounted) {
                    setState(() {});
                  }
                  if (!_pdfTextSearchResult.hasResult &&
                      _pdfTextSearchResult.isSearchCompleted) {
                    widget.onTap?.call('noResultFound');
                  }
                });
              } else {
                clearSearch();
                widget.controller!.clearSelection();
                setState(() {});
              }
            },
          ),
        ),
        Visibility(
          visible: _editingController.text.isNotEmpty,
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.clear,
                color: theme.colorScheme.onPrimary,
                size: 24,
              ),
              onPressed: () {
                setState(() {
                  _editingController.clear();
                  widget.controller!.clearSelection();
                  clearSearch();
                  focusNode!.requestFocus();
                });
                widget.onTap!.call('Clear Text');
              },
              tooltip: widget.showTooltip ? 'Clear Text' : null,
            ),
          ),
        ),
        Visibility(
          visible:
              !_pdfTextSearchResult.isSearchCompleted && _isSearchInitiated,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: theme.primaryColor,
              ),
            ),
          ),
        ),
        Visibility(
          visible: _pdfTextSearchResult.hasResult,
          child: Row(
            children: <Widget>[
              Text(
                '${_pdfTextSearchResult.currentInstanceIndex}',
                style:
                    TextStyle(color: theme.colorScheme.onPrimary, fontSize: 16),
              ),
              Text(
                LocaleKeys.pdf_viewer_search_toolbar_of.tr(),
                style:
                    TextStyle(color: theme.colorScheme.onPrimary, fontSize: 16),
              ),
              Text(
                '${_pdfTextSearchResult.totalInstanceCount}',
                style:
                    TextStyle(color: theme.colorScheme.onPrimary, fontSize: 16),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(
                    Icons.navigate_before,
                    color: theme.colorScheme.onPrimary,
                    size: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      _pdfTextSearchResult.previousInstance();
                    });
                    widget.onTap!.call('Previous Instance');
                  },
                  tooltip: widget.showTooltip ? 'Previous' : null,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(
                    Icons.navigate_next,
                    color: theme.colorScheme.onPrimary,
                    size: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.controller!.clearSelection();
                      _pdfTextSearchResult.nextInstance();
                    });
                    widget.onTap!.call('Next Instance');
                  },
                  tooltip: widget.showTooltip ? 'Next' : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
