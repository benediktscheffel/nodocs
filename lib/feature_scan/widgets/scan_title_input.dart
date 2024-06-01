import 'package:flutter/material.dart';

class ScanTitleInput extends StatefulWidget {
  const ScanTitleInput({super.key});

  @override
  State<StatefulWidget> createState() => _ScanTitleInputState();
}

class _ScanTitleInputState extends State<ScanTitleInput> {
  final TextEditingController _controller = TextEditingController(
      text: 'Title of Document'
  );
  final FocusNode _focusNode = FocusNode();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isTyping = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: const Color(0x4C2196F3),
          selectionHandleColor: theme.colorScheme.secondary,
          cursorColor: theme.colorScheme.onPrimary,
        ),
      ),
      child: Stack(
        children: <Widget>[
          CustomPaint(
            painter: DottedUnderlinePainter(
              color: theme.colorScheme.onPrimary,
              width: 1.0,
            ),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _isTyping ? null : IconButton(
              onPressed: () {
                _focusNode.requestFocus();
              },
              icon: Icon(
                Icons.edit_outlined,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedUnderlinePainter extends CustomPainter {
  final Color color;
  final double width;

  DottedUnderlinePainter({required this.color, required this.width});

  @override
  void paint(final Canvas canvas, final Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5.0;
    const double dashSpace = 3.0;
    double startX = 0.0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, size.height), Offset(startX + dashWidth, size.height), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(final CustomPainter oldDelegate) {
    return false;
  }
}