import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

typedef OnPageSelect = void Function(int pageIndex);

class ScanCarousel extends StatefulWidget {
  final OnPageSelect onPageSelect;

  const ScanCarousel({super.key, required this.onPageSelect});

  @override
  State<StatefulWidget> createState() => _ScanCarouselState();
}

class _ScanCarouselState extends State<ScanCarousel> {
  List<Widget> imageSliders = <Widget>[];
  List<String> images = <String>[];
  String imageFolder = '/data/data/com.example.nodocs/files/Collection1/';
  int current = 0;
  final CarouselController controller = CarouselController();

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    try {
      images = await _listImagePathsInDirectory();
      setState(() {
        imageSliders = images
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
                        color: Theme.of(context).colorScheme.secondary,
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
          )).toList();
      });
    } catch (e) {
      print('Error loading images: $e');
    }
  }

  Future<List<String>> _listImagePathsInDirectory() async {
    final Directory directory = Directory(imageFolder);
    if (!await directory.exists()) {
      throw Exception("Directory does not exist");
    }
    List<String> imageFiles = <String>[];

    final List<String> supportedExtensions = <String>['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];

    await for (FileSystemEntity entity in directory.list(recursive: false, followLinks: false)) {
      if (entity is File) {
        final String extension = entity.path.split('.').last.toLowerCase();
        if (supportedExtensions.contains(extension)) {
          imageFiles.add(entity.path);
        }
      }
    }
    return imageFiles;
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        if (imageSliders.isNotEmpty)
          CarouselSlider(
            items: imageSliders,
            carouselController: controller,
            options: CarouselOptions(
              height: 300,
              autoPlay: false,
              aspectRatio: 3/4,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              onPageChanged: (final int index, final CarouselPageChangedReason reason) {
                setState(() {
                  current = index;
                  widget.onPageSelect(index);
                });
              }
            ),
          ),
        if (images.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((final MapEntry<int, String> entry) {
              return GestureDetector(
                onTap: () {
                  controller.animateToPage(entry.key);
                },
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          )
      ],
    );
  }
}