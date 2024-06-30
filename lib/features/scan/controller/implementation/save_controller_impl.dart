import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
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
import 'package:nodocs/util/logging/log.dart';
import 'package:path_provider/path_provider.dart';
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
  }) {
    return const SaveModel(
      tags: <String>{
        "Tag1",
        "Tag2",
        "Tag3",
        "Tag4",
        "Tag5",
        "Tag6",
        "Tag7",
        "Tag8",
        "Tag9",
        "Tag10",
      },
      currentSliderIndex: 0,
      imagePaths: <String>[],
      toggleCamera: false,
    );
  }

  @override
  void init(final List<String> imagePaths) {
    state = state.copyWith(imagePaths: imagePaths);
  }

  @override
  void clear() {
       state = state.copyWith(
         tags: <String>{
           "Tag1",
           "Tag2",
           "Tag3",
           "Tag4",
           "Tag5",
           "Tag6",
           "Tag7",
           "Tag8",
           "Tag9",
           "Tag10",
         },
         currentSliderIndex: 0,
         imagePaths: <String>[],
         toggleCamera: false,
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
    final Directory directory = await getApplicationDocumentsDirectory();
    // TODO take directory from dropdown selection
    final String path = '${directory.path}/.pdf';
    final File output = File(path);
    await output.writeAsBytes(await pdf);
    _log.i("Document saved at: $path");
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
  Set<String> getTags() {
    return state.tags;
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
}