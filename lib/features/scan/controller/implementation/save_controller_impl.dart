import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart'as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/filesystem/services/file_system_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/save_controller.dart';
import 'package:nodocs/features/scan/model/save_model.dart';
import 'package:nodocs/features/scan/services/carousel_service.dart';
import 'package:nodocs/features/scan/services/crop_service.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
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
    required final FileSystemService fileSystemService,
    required final NavigationService navigationService,
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
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        throw Exception('No internet connection');
      }
    } on SocketException {
      throw Exception('No internet connection');
    }
  }

  @override
  void showErrorDuringOcrDialog(final BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (final BuildContext context) {
        return ConfirmationDialog(
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onCancel: (){},
          header: "Something went wrong!",
          notificationText: "Something went wrong during the OCR process.\nPlease try again or save without OCR",
          cancelText: "",
          confirmText: "OK",
        );
      },
    );
  }

  @override
  void showErrorInternetDialog(final BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (final BuildContext context) {
        return ConfirmationDialog(
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onCancel: (){},
          header: "Please check your internet connection!",
          notificationText: "An internet connection is required to process the document.",
          cancelText: "",
          confirmText: "OK",
        );
      },
    );
  }

  @override
  void handleDocumentOCR(final BuildContext context, final List<String> paths) async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final pw.Document pdf = await createPDF(paths);
        final String accessToken = await retrieveAccessToken().catchError((final _) {
          if (context.mounted) {
            showErrorDuringOcrDialog(context);
          }
          throw Exception("Failed retrieving access token");
        });
        final String assetID = await uploadAsset(pdf, accessToken).catchError((final _) {
          if (context.mounted) {
            showErrorDuringOcrDialog(context);
          }
          throw Exception("Failed uploading the asset");
        });
        final String location = await ocrDocument(assetID, accessToken).catchError((final _) {
          if (context.mounted) {
            showErrorDuringOcrDialog(context);
          }
          throw Exception("Failed OCR'ing the document");
        });
        pollAndSaveDocument(location, accessToken).then((final void success) {
          if (context.mounted) {
            GoRouter.of(context).go(NavigationServiceRoutes.home);
          }
        }).catchError((final dynamic error) {
          if (context.mounted) {
            showErrorDuringOcrDialog(context);
          }
          throw Exception("Failed polling the document");
        });
      }
    } on SocketException catch (e) {
      if (context.mounted) {
        showErrorInternetDialog(context);
      }
      throw Exception("$e: Unable to OCR document! Check your internet connection!");
    }
  }

  @override
  Future<String> retrieveAccessToken() async {
    String base = dotenv.env['BASE']==null ? '' : dotenv.env['BASE']!;
    String route = dotenv.env['TOKEN_ROUTE']==null ? '' : dotenv.env['TOKEN_ROUTE']!;
    String clientID = dotenv.env['CLIENT_ID']==null ? '' : dotenv.env['CLIENT_ID']!;
    String clientSecret = dotenv.env['CLIENT_SECRET']==null? '' : dotenv.env['CLIENT_SECRET']!;

    final Uri url = Uri.https(base, route);
    http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        encoding: Encoding.getByName('application/x-www-form-urlencoded'),
        body: <String, String>{
          'client_id': clientID,
          'client_secret': clientSecret
        }
    ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Failed to retrieve access token: Timeout')
    );
    if (response.statusCode != 200) {
      throw Exception('${response.statusCode}: Failed to retrieve access token');
    }
    final Map<String, dynamic> responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    return responseJson['access_token'].toString();
  }

  @override
  Future<String> uploadAsset(final pw.Document pdf, final String accessToken) async {
    String base = dotenv.env['BASE']==null ? '' : dotenv.env['BASE']!;
    String route = dotenv.env['ASSETS_ROUTE']==null ? '' : dotenv.env['ASSETS_ROUTE']!;
    String clientID = dotenv.env['CLIENT_ID']==null ? '' : dotenv.env['CLIENT_ID']!;

    final Uri url = Uri.https(base, route);
    http.Response response = await http.post(
        url,
        headers: <String, String>{
          'X-API-Key': clientID,
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'mediaType': 'application/pdf'
        })
    ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Failed to upload pre-signed URI: Timeout')
    );
    if (response.statusCode != 200) {
      throw Exception('${response.statusCode}: Failed to upload pre-signed URI');
    }

    final Map<String, dynamic> responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    final String uri = responseJson['uploadUri'];
    final String assetID = responseJson['assetID'].toString();

    http.Response response2 = await http.put(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': 'application/pdf',
      },
      body: (await pdf.save()),
    ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Failed to upload PDF: Timeout')
    );
    if (response2.statusCode != 200) {
      throw Exception('${response2.statusCode}: Failed to upload PDF');
    }
    return assetID;
  }

  @override
  Future<void> pollAndSaveDocument(final String location, final String accessToken) async {
    Map<String, dynamic> documentStatusAndDownloadUri = await getStatusAndDownloadUri(location, accessToken);
    while (documentStatusAndDownloadUri['status'] == 'in progress') {
      _log.i("Status: ${documentStatusAndDownloadUri['status']}");
      documentStatusAndDownloadUri = await getStatusAndDownloadUri(location, accessToken);
    }
    if (documentStatusAndDownloadUri['status'] == 'done') {
      _log.i("Status: ${documentStatusAndDownloadUri['status']}");
      final String downloadUri = documentStatusAndDownloadUri['asset']['downloadUri'];
      http.Response response = await http.get(
        Uri.parse(downloadUri),
      ).timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw Exception('Failed to download Document: Timeout')
      );
      if (response.statusCode != 200) {
        throw Exception('${response.statusCode}: Failed to download Document');
      }
      await savePDF(response.bodyBytes);
    } else {
      throw Exception('Failed to OCR Document');
    }
  }

  @override
  Future<Map<String, dynamic>> getStatusAndDownloadUri(final String location, final String accessToken) async {
    String clientID = dotenv.env['CLIENT_ID']==null ? '' : dotenv.env['CLIENT_ID']!;

    http.Response response = await http.get(
        Uri.parse(location),
        headers: <String, String>{
          'Authorization': 'Bearer $accessToken',
          'x-api-key': clientID,
        }
    ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Failed to poll status of Document: Timeout')
    );
    if (response.statusCode != 200) {
      throw Exception('${response.statusCode}: Failed to poll status of Document');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  @override
  Future<String> ocrDocument(final String assetID, final String accessToken) async {
    String base = dotenv.env['BASE']==null ? '' : dotenv.env['BASE']!;
    String route = dotenv.env['OCR_ROUTE']==null ? '' : dotenv.env['OCR_ROUTE']!;
    String clientID = dotenv.env['CLIENT_ID']==null ? '' : dotenv.env['CLIENT_ID']!;

    final Uri url = Uri.https(base, route);
    http.Response response = await http.post(
        url,
        headers: <String, String>{
          'x-api-key': clientID,
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(<String, String>{
          'assetID': assetID,
          'ocrLang': 'en-US' // TODO get this from settings
        })
    ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Failed to OCR Document: Timeout')
    );
    if (response.statusCode != 201) {
      throw Exception('${response.statusCode}: Failed to OCR Document');
    }

    final Map<String, dynamic> responseHeader = response.headers as Map<String, dynamic>;
    return responseHeader['location'];
  }

  @override
  Future<pw.Document> createPDF(final List<String> imagePaths) async {
    final pw.Document pdf = pw.Document();
    for (final String path in imagePaths) {
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
  Future<void> savePDF(final pdf) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    // TODO take directory from dropdown selection
    final String path = '${directory.path}/.pdf';
    final File output = File(path);
    await output.writeAsBytes(await pdf);
    _log.i("Document saved at: $path");
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