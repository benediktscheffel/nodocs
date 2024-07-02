import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/gen/locale_keys.g.dart';

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
          throw Exception(LocaleKeys.general_image_with_loading_error_loading_image.tr());
        } else {
          return Image.asset(imagePath);
        }
      },
    );
  }
}