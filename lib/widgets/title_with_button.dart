import 'package:flutter/material.dart';

class TitleWithButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onButtonClick;
  final double? orientationAngle;

  const TitleWithButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onButtonClick,
      this.orientationAngle});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final bool landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Stack(
      children: <Widget>[
        SizedBox(
          height: landscape ? size.width * 0.048 : size.height * 0.048,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: theme.textTheme.bodyMedium!.fontSize,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: -4.5,
          child: Transform.rotate(
            angle: orientationAngle != null ? orientationAngle! : 0,
            child: IconButton(
              onPressed: onButtonClick,
              icon: Icon(
                icon,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}