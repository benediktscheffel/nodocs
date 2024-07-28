import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/gen/locale_keys.g.dart';

class TagInput extends StatefulWidget {
  final Function(String) addTag;

  const TagInput({
    super.key,
    required this.addTag,
  });

  @override
  TagInputState createState() => TagInputState();
}

class TagInputState extends State<TagInput> {
  late final TextEditingController _controller;
  bool isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(updateTextState);
  }
  
  @override
  void dispose() {
    _controller.removeListener(updateTextState);
    _controller.dispose();
    super.dispose();
  }

  void updateTextState() {
    setState(() {
      isTextEmpty = _controller.text.isEmpty;
    });
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        prefix: const Text('# '),
        hintText: LocaleKeys.pdf_viewer_tags_dialog_input_hint_text.tr(),
        suffixIcon: isTextEmpty
            ? null
            : IconButton(
                onPressed: () {
                  widget.addTag(_controller.text);
                  _controller.text = '';
                },
                icon: Icon(
                  Icons.add_circle_outlined,
                  color: theme.colorScheme.secondary,
                ),
              ),
      ),
    );
  }
}
