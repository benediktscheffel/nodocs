import 'package:flutter/material.dart';

class ImageWithLoading extends StatelessWidget {
  final String imagePath;

  const ImageWithLoading({super.key, required this.imagePath});

  Future<void> _loadImage(final BuildContext context) async {
    await precacheImage(AssetImage(imagePath), context);
  }

  @override
  Widget build(final BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FutureBuilder<void>(
      future: _loadImage(context),
      builder: (final BuildContext context, final AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: theme.colorScheme.onPrimary,
            )
          );
        } else if (snapshot.hasError) {
          throw Exception('Error loading image');
        } else {
          return Image.asset(imagePath);
        }
      },
    );
  }
}