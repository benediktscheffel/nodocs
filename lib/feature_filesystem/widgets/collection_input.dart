import 'package:flutter/material.dart';

class CollectionInput extends StatefulWidget {
  const CollectionInput({super.key});

  @override
  CollectionInputState createState() => CollectionInputState();
}

class CollectionInputState extends State<CollectionInput> {
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
        hintText: 'New Collection',
        suffixIcon: isTextEmpty ? null : IconButton(
          onPressed: () {
            controller.text = '';
          },
          icon: const Icon(
            Icons.cancel_outlined,
          ),
        ),
      ),
    );
  }
}