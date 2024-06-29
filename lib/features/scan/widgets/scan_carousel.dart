import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/scan/controller/implementation/save_provider.dart';
import 'package:nodocs/features/scan/controller/save_controller.dart';

class ScanCarousel extends ConsumerWidget {
  final List<String> imagePaths;

  const ScanCarousel({super.key, required this.imagePaths});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    SaveController saveController = ref.watch(saveControllerProvider);
    final CarouselController carouselController = CarouselController();
    return Column(
      children: <Widget>[
        if (saveController.getImageWidgets().isNotEmpty)
          CarouselSlider(
            items: saveController.getImageWidgets(),
            carouselController: carouselController,
            options: CarouselOptions(
              height: 300,
              autoPlay: false,
              aspectRatio: 3/4,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              onPageChanged: (final int index, final CarouselPageChangedReason reason) {
                saveController.setCurrentSliderIndex(index);
              }
            ),
          ),
        if (imagePaths.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagePaths.asMap().entries.map((final MapEntry<int, String> entry) {
              return GestureDetector(
                onTap: () {
                  carouselController.animateToPage(entry.key);
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
                        .withOpacity(saveController.getCurrentSliderIndex() == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          )
      ],
    );
  }
}