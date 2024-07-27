import 'dart:io';

import 'package:flutter/material.dart';

class ScanBoxLastImage extends StatelessWidget {
  final String imgPath;
  final int scanCounter;
  final VoidCallback onTap;

  const ScanBoxLastImage(
      {super.key,
      required this.imgPath,
      required this.scanCounter,
      required this.onTap});

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    if (imgPath != '') {
      return Image(
        image: FileImage(File(imgPath)),
        frameBuilder: (final BuildContext context, final Widget child,
            final int? frame, final bool? wasSynchronouslyLoaded) {
          TextStyle textStyle = TextStyle(
            color: Colors.white,
            fontSize: theme.textTheme.bodySmall!.fontSize,
          );
          return Center(
            child: InkWell(
              onTap: () {
                onTap.call();
              },
              child: Container(
                height: size.height * 0.056,
                width: size.height * 0.056,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Image(
                        image: FileImage(File(imgPath)),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: scanCounter.toString().length > 1
                          ? Container(
                              width: 22,
                              height: 22,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                              ),
                              child: Center(
                                child: Text(
                                  '9+',
                                  style: textStyle,
                                ),
                              ),
                            )
                          : Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(
                                child: Text(
                                  scanCounter.toString(),
                                  style: textStyle,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
    return Center(
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
    );
  }
}
