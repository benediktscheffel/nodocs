import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'save_model.freezed.dart';

@freezed
class SaveModel with _$SaveModel {
  const factory SaveModel({
    required final String selectedImagePath,
    required final String imageFolder,
    required final Set<String> imagePaths,
    required final Set<String> tags,
    required final Set<Widget> imageSliders,
    required final int currentSliderIndex,
  }) = _SaveModel;
}