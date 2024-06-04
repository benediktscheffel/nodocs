import 'package:flutter/material.dart';

class TagChip extends StatefulWidget {
  final bool tagState;
  final String tagName;

  const TagChip({super.key, required this.tagState, required this.tagName});

  @override
  TagChipState createState() => TagChipState();
}


class TagChipState extends State<TagChip> {
  late bool _tagState;

  @override
  void initState() {
    super.initState();
    _tagState = widget.tagState;
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 40,
      child: InputChip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(style: BorderStyle.none),
        ),
        showCheckmark: false,
        label: _tagState ?
          IntrinsicWidth(
            child: Row(children: <Widget>[
              const Text("# ", style: TextStyle(fontSize: 14),),
              Text(widget.tagName, style: const TextStyle(fontSize: 14),)
            ])
          ) :
          IntrinsicWidth(
            child: Row(children: <Widget>[
              const Icon(Icons.add_outlined, size: 23,),
              Text(widget.tagName, style: const TextStyle(fontSize: 14),)
            ])
          ),
        onSelected: (final bool _) {
          setState(() {
            _tagState = !_tagState;
          });
        },
        selected: _tagState,
        color: _tagState ?
          WidgetStateProperty.all<Color>(theme.colorScheme.secondary) :
          WidgetStateProperty.all<Color>(theme.colorScheme.tertiary),
        deleteIcon: _tagState ? const Icon(Icons.close, size: 20,): null,
        onDeleted: _tagState ? () {}: null,
      ),
    );
  }
}