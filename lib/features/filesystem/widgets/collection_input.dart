import 'package:flutter/material.dart';

class CollectionInput extends StatefulWidget {
  const CollectionInput({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

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
      autofocus: true,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: isTextEmpty
            ? null
            : IconButton(
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
