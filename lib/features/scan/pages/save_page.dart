import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nodocs/features/filesystem/widgets/collection_dropdown.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button_container.dart';
import 'package:nodocs/features/scan/widgets/scan_carousel.dart';
import 'package:nodocs/features/scan/widgets/scan_ocr_loading_dialog.dart';
import 'package:nodocs/features/scan/widgets/scan_title_input.dart';
import 'package:nodocs/features/tags/widgets/tag_dropdown.dart';
import 'package:nodocs/go_router.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/dropdown_with_label.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<StatefulWidget> createState() => SavePageState();
}

class SavePageState extends State<SavePage> {
  String selectedImagePath = "";

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const ScanTitleInput(),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: DropdownWithLabel(
                    dropdown: TagDropdown(
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
                        "Tag10"
                      },
                    ),
                    label: "Select Tags",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: DropdownWithLabel(
                    dropdown: CollectionDropdown(),
                    label: "Select Folder",
                  ),
                ),
                const SizedBox(height: 5,),
                ScanCarousel(onPageSelect: (final String path) {
                  selectedImagePath = path;
                },),
                const SizedBox(height: 5,),
                ScanActionButtonContainer(
                  buttons: <Widget>[
                    ScanActionButton(
                      buttonIcon: Icons.crop_free_outlined,
                      buttonText: 'Crop Again',
                      onPressed: () {
                        CropPageRoute(path: selectedImagePath).go(context);
                      },
                    ),
                    ScanActionButton(
                      buttonIcon: Icons.flip_camera_ios_outlined,
                      buttonText: 'Retake',
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (final BuildContext context) =>
                          ConfirmationDialog(
                            onConfirm: (){
                              // TODO delete current selected page
                              const ScanPageRoute().go(context);
                            },
                            onCancel: (){
                              Navigator.pop(context);
                            },
                            header: 'Retake this scan?',
                            notificationText: 'Are you sure you want to retake the scan of the current page without saving?'
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: 'Cancel',
            buttonIcon: Icons.cancel_outlined,
            onPressed: () => showDialog<String>(
              context: context,
              builder: (final BuildContext context) =>
                ConfirmationDialog(
                  onConfirm: (){
                    const HomeRoute().go(context);
                  },
                  onCancel: (){
                    Navigator.pop(context);
                  },
                  header: 'Cancel this scan?',
                  notificationText: 'Are you sure you want to discard this scan without saving? This will discard all pages of this scan.'
                ),
            ),
          ),
          NavigationButton(
              buttonText: 'Save',
              buttonIcon: Icons.save_outlined,
              onPressed: () async {
                // TODO Write Tags to Database and Save PDF in selected folder
                savePDF((await createPDF(<String>[selectedImagePath, selectedImagePath])).save());
              }
          ),
          NavigationButton(
            buttonText: 'OCR & Save',
            buttonIcon: Icons.document_scanner_outlined,
            onPressed: () {
              // TODO Write Tags to Database and Save PDF in selected folder
              showDialog<String>(
                context: context,
                builder: (final BuildContext context) {
                  handleDocumentOCR(context);
                  return const ScanOcrLoadingDialog();
                },
              );
              // await captureAndCreatePDF(XFile(selectedImagePath));
            }
          ),
        ],
      ),
    );
  }
  Future<void> checkInternetConnection() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        throw Exception('No internet connection');
      }
    } on SocketException catch (e) {
      throw Exception('No internet connection');
    }
  }

  void showErrorDuringOcrDialog() {
    if (context.mounted){
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
  }

  void showErrorInternetDialog() {
    if (context.mounted){
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
  }

  void handleDocumentOCR(final BuildContext context) async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final pw.Document pdf = await createPDF(<String>[selectedImagePath, selectedImagePath]);
        final String accessToken = await retrieveAccessToken().catchError((final _) {
          showErrorDuringOcrDialog();
          throw Exception("Failed retrieving access token");
        });
        final String assetID = await uploadAsset(pdf, accessToken).catchError((final _) {
          showErrorDuringOcrDialog();
          throw Exception("Failed uploading the asset");
        });
        final String location = await ocrDocument(assetID, accessToken).catchError((final _) {
          showErrorDuringOcrDialog();
          throw Exception("Failed OCR'ing the document");
        });
        pollAndSaveDocument(location, accessToken).then((final void success) {
          if (context.mounted) {
            const HomeRoute().go(context);
          }
        }).catchError((final dynamic error) {
          showErrorDuringOcrDialog();
          throw Exception("Failed polling the document");
        });
      }
    } on SocketException catch (e) {
      showErrorInternetDialog();
      throw Exception("$e: Unable to OCR document! Check your internet connection!");
      }
    }
  }

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

  Future<void> pollAndSaveDocument(final String location, final String accessToken) async {
    Map<String, dynamic> documentStatusAndDownloadUri = await getStatusAndDownloadUri(location, accessToken);
    while (documentStatusAndDownloadUri['status'] == 'in progress') {
      print("Status: ${documentStatusAndDownloadUri['status']}");
      documentStatusAndDownloadUri = await getStatusAndDownloadUri(location, accessToken);
    }
    if (documentStatusAndDownloadUri['status'] == 'done') {
      print("Status: ${documentStatusAndDownloadUri['status']}");
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

  Future<void> savePDF(final pdf) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    // TODO take directory from dropdown selection
    final String path = '${directory.path}/.pdf';
    final File output = File(path);
    await output.writeAsBytes(await pdf);
    print("Document saved at: $path");
  }
}