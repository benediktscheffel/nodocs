import 'package:flutter/material.dart';

abstract class CarouselService {
  List<Widget> buildImageWidgets(final List<String> imagePaths);
}
