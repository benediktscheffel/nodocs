import 'dart:io';
import 'package:flutter/material.dart';

class CarouselService {
  static Set<String> listImagePathsInDirectory(final String imageFolder) {
    final Directory directory = Directory(imageFolder);
    List<String> imageFiles = <String>[];

    final List<String> supportedExtensions = <String>['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];

    for (FileSystemEntity entity in directory.listSync(recursive: false, followLinks: false)) {
      if (entity is File) {
        final String extension = entity.path.split('.').last.toLowerCase();
        if (supportedExtensions.contains(extension)) {
          imageFiles.add(entity.path);
        }
      }
    }
    return imageFiles.toSet();
  }

  static Set<Widget> loadImages(final String imageFolder) {
    try {
      List<String> images = CarouselService.listImagePathsInDirectory(imageFolder).toList();
      return images
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
                    'Page ${images.indexOf(path) + 1}',
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
      )).toSet();
    } catch (e) {
      return <Widget>{};
    }
  }
}