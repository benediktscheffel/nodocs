import 'package:flutter/material.dart';

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
  final TextEditingController controller = TextEditingController();
  bool isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(updateTextState);
  }

  void updateTextState() {
    setState(() {
      isTextEmpty = controller.text.isEmpty;
    });
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefix: const Text('# '),
        hintText: 'Create new Tag',
        suffixIcon: isTextEmpty
            ? null
            : IconButton(
                onPressed: () {
                  widget.addTag(controller.text);
                  controller.text = '';
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
