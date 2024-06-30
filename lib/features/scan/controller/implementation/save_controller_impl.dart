import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/implementation/file_system_service_impl.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/save_controller.dart';
import 'package:nodocs/features/scan/model/save_model.dart';
import 'package:nodocs/features/scan/services/carousel_service.dart';
import 'package:nodocs/features/scan/services/crop_service.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/features/scan/services/ocr_service.dart';
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_controller_impl.g.dart';

@riverpod
class SaveControllerImpl extends _$SaveControllerImpl implements SaveController {
  final Logger _log = getLogger();

  @override
  SaveModel build({
    required final FileSystemServiceImpl fileSystemService,
    required final NavigationService navigationService,
    required final OcrService ocrService,
    required final PersistenceService persistenceService,
  }) {
    return const SaveModel(
      tags: <String, bool>{},
      currentSliderIndex: 0,
      imagePaths: <String>[],
      toggleCamera: false,
      savePath: '',
      title: '',
    );
  }

  @override
  void init(final List<String> imagePaths) {
    final List<String> tags = persistenceService.loadAllTags();
    tags.sort();
    final String rootDirectory = fileSystemService.getRootDirectory();
    state = state.copyWith(
      tags: <String, bool>{ for (final String tag in tags) tag : false },
      currentSliderIndex: 0,
      imagePaths: imagePaths,
      toggleCamera: false,
      savePath: rootDirectory,
      title: LocaleKeys.save_default_title.tr(),
    );
  }

  @override
  Future<void> checkInternetConnection() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('example.com');
      if (!(result.isNotEmpty && result[0].rawAddress.isNotEmpty)) {
        throw Exception('Unable to OCR document! Check your internet connection!');
      }
    } on SocketException catch(e) {
      throw Exception("$e: Unable to OCR document! Check your internet connection!");
    }
  }

  @override
  Future<void> handleDocumentOCR() async {
    final pw.Document originalPdf = await createPDF();
    final Uint8List ocrPdf = await ocrService.ocrDocument(originalPdf, _log);
    await savePDF(ocrPdf);
  }

  @override
  Future<void> savePDF(final pdf) async {
    final String path = '${state.savePath}/${state.title}.pdf';
    final File output = File(path);
    await output.writeAsBytes(await pdf);
    _log.i("Document saved at: $path");
    await persistenceService.insertFile(path);
    await persistenceService.addTagsToFile(path, _getSelectedTags());
    _log.i("Tags saved to Database");
  }

  @override
  Future<pw.Document> createPDF() async {
    final pw.Document pdf = pw.Document();
    for (final String path in state.imagePaths) {
      final pw.MemoryImage image = pw.MemoryImage(File(path).readAsBytesSync());
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.zero,
          build: (final pw.Context context) {
            return pw.Image(image);
          },
        ),
      );
    }
    return pdf;
  }

  @override
  void goToPage(final Uri uri) {
    _log.i("Navigating to: ${uri.toString()}");
    navigationService.push(uri.toString());
  }

  @override
  void goBack() {
    _log.i("Going back");
    navigationService.pop();
  }

  String _getImagePathById(final int id) {
    return (id >= 0 && state.imagePaths.length > id) ? state.imagePaths.elementAt(id) : '';
  }

  @override
  List<Widget> getImageWidgets() {
    return CarouselService.buildImageWidgets(state.imagePaths);
  }

  @override
  void setCurrentSliderIndex(final int index) {
    state = state.copyWith(currentSliderIndex: index);
  }

  @override
  int getCurrentSliderIndex() {
    return state.currentSliderIndex;
  }

  @override
  List<String> getTags() {
    return state.tags.keys.toList();
  }

  @override
  List<String> getImagePaths() {
    return state.imagePaths;
  }

  @override
  XFile getSelectedImageFile() {
    String path = _getImagePathById(state.currentSliderIndex);
    return XFile(path);
  }

  @override
  void setEditedImage(final String path) {
    String pathToReplace = _getImagePathById(state.currentSliderIndex);
    state = state.copyWith(
        imagePaths: ImageService.replaceImagePath(
            pathToReplace, path, state.imagePaths));
  }

  @override
  Future<CroppedFile?> cropImage(final ThemeData theme, final XFile pickedFile, final BuildContext context) {
    return CropService.cropImage(theme, pickedFile, context);
  }

  @override
  void toggleCamera() {
    state = state.copyWith(toggleCamera: !state.toggleCamera);
  }

  @override
  bool getCameraState() {
    return state.toggleCamera;
  }

  @override
  String getTitle() {
    return state.title;
  }

  @override
  void setTitle(final String title) {
    state = state.copyWith(title: title);
  }

  @override
  String getDirectory() {
    return state.savePath;
  }

  @override
  void setDirectory(final String dir) {
    state = state.copyWith(savePath: dir);
  }

  List<String> _getSelectedTags() {
    return state.tags.entries
        .where((final MapEntry<String, bool> entry) => entry.value)
        .map((final MapEntry<String, bool> entry) => entry.key)
        .toList();
  }

  @override
  void toggleTag(final String tag) {
    final bool currentState = state.tags[tag]!;
    Map<String, bool> updatedTags = Map<String, bool>.from(state.tags);
    updatedTags[tag] = !currentState;
    _log.i("$tag is ${!currentState} now");
    state = state.copyWith(tags: updatedTags);
  }
}