import 'package:flutter/material.dart';

class SearchResultTile extends StatelessWidget {
  final int textCount;
  final List<String> tags;
  final String path;
  final String searchString;
  final String title;
  final VoidCallback onTapPdf;

  const SearchResultTile({
    super.key,
    required this.textCount,
    required this.tags,
    required this.path,
    required this.searchString,
    required this.title,
    required this.onTapPdf,
  });

  @override
  Widget build(final BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<TextSpan> titleSpans = parseMarkedText(markFirstOccurrence(title, searchString));
    return Column(
      children: <Widget>[
        ListTile(
          title:
            RichText(
              text: TextSpan(
                style: TextStyle(color: theme.colorScheme.onPrimary),
                children: titleSpans,
              ),
            ),
          subtitle: Row(
            children: <Widget>[
              Text('$textCount matches found ${tags.isNotEmpty ? '|' : ''}'),
              ...tags.map((final String tag) {
                List<TextSpan> tagSpans = parseMarkedText(markFirstOccurrence(tag, searchString));
                return Row(
                  children: <Widget>[
                  const Text(' #'),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: theme.colorScheme.onPrimary),
                      children: tagSpans,
                    ),
                  ),
                  ],
                );
              })
            ],
          ),
          leading:
            Icon(
              Icons.picture_as_pdf_outlined,
              color: theme.colorScheme.onPrimary,
            ),
          onTap: () => onTapPdf.call()
        ),
      ],
    );
  }

  List<TextSpan> parseMarkedText(final String markedText) {
    List<TextSpan> spans = <TextSpan>[];
    int currentIndex = 0;

    while (currentIndex < markedText.length) {
      int markStart = markedText.indexOf('<mark>', currentIndex);
      if (markStart == -1) {
        spans.add(TextSpan(text: markedText.substring(currentIndex)));
        break;
      }
      if (markStart > currentIndex) {
        spans.add(TextSpan(text: markedText.substring(currentIndex, markStart)));
      }
      int markEnd = markedText.indexOf('</mark>', markStart);
      if (markEnd == -1) {
        spans.add(TextSpan(text: markedText.substring(markStart)));
        break;
      }

      spans.add(TextSpan(
        text: markedText.substring(markStart + 6, markEnd),
        style: const TextStyle(backgroundColor: Colors.orange),
      ));
      currentIndex = markEnd + 7;
    }
    return spans;
  }

  String markFirstOccurrence(final String text, final String search) {
    int startIndex = text.indexOf(search);
    if (startIndex == -1) {
      return text;
    }
    int endIndex = startIndex + search.length;
    return '${text.substring(0, startIndex)}<mark>${text.substring(startIndex, endIndex)}</mark>${text.substring(endIndex)}';
  }
}
