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
    final Size size = MediaQuery.of(context).size;
    if (animate) {
      return  Center(
        child: SizedBox(
          height: size.height * 0.073,
          width: size.height * 0.073,
          child: const CircularProgressIndicator(
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
          child: SizedBox(
            height: size.height * 0.073,
            width: size.height * 0.073,
            child: const CircularProgressIndicator(
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