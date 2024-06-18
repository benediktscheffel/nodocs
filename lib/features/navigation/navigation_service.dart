import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

abstract class NavigationService {
  void goBack({final Uri? fallbackUri});
  void pop<T>({final T? data});
  void push(final String uri);
  void replaceWith(final Uri uri);
  void replaceWithNamed(final Uri uri);
  TaskEither<Object, Option<T>> showPopup<T>(
      final Widget popup, {
        final bool canBePoppedViaBackGesture,
      });
}
