import 'package:flutter/material.dart';

class TagInput extends StatefulWidget {
  const TagInput({super.key});

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
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefix: const Text('# '),
        hintText: 'Create new Tag',
        suffixIcon: isTextEmpty ? null : IconButton(
          onPressed: () {
            // TODO add to other Tags
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