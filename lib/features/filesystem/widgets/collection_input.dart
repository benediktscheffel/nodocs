import 'package:flutter/material.dart';

class CollectionInput extends StatefulWidget {
  const CollectionInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  CollectionInputState createState() => CollectionInputState();
}

class CollectionInputState extends State<CollectionInput> {
  bool isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(updateTextState);
  }

  void updateTextState() {
    setState(() {
      isTextEmpty = widget.controller.text.isEmpty;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: 'New Collection',
        suffixIcon: isTextEmpty ? null : IconButton(
          onPressed: () {
            widget.controller.text = '';
          },
          icon: const Icon(
            Icons.cancel_outlined,
          ),
        ),
      ),
    );
  }
}