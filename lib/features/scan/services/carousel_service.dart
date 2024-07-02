import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/gen/locale_keys.g.dart';

class CarouselService {
  static List<Widget> buildImageWidgets(final List<String> imagePaths) {
    return imagePaths
        .map((final String path) => Container(
      height: 100,
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 1000,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFF0353A4),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Image.file(
                  File(path),
                  fit: BoxFit.contain,
                  height: 200.0,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  '${LocaleKeys.save_carousel_page.tr()} ${imagePaths.indexOf(path) + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )).toList();
  }
}