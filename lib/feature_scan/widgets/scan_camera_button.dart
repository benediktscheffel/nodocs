import 'package:flutter/material.dart';

class ScanCameraButton extends StatefulWidget {
  final VoidCallback onAnimationEnd;
  const ScanCameraButton({super.key, required this.onAnimationEnd});

  @override
  State<StatefulWidget> createState() => ScanCameraButtonState();
}

class ScanCameraButtonState extends State<ScanCameraButton> with TickerProviderStateMixin {
  bool animate = false;

  @override
  void initState() {
    super.initState();
  }

  void _toggleAnimation() {
    Future<void>.delayed(const Duration(seconds: 1), () {
      setState(() {
        animate = !animate;
      });
      widget.onAnimationEnd.call();
    });
  }

  @override
  Widget build(final BuildContext context) {
    if (animate) {
      return const Center(
        child: SizedBox(
          height: 65,
          width: 65,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 5,
          ),
        ),
      );
    } else {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              animate = !animate;
            });
            _toggleAnimation();
          },
          child: const SizedBox(
            height: 65,
            width: 65,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              value: 1,
              strokeWidth: 5,
            ),
          ),
        ),
      );
    }
  }
}