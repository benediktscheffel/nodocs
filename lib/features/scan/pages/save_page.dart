import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nodocs/features/filesystem/widgets/collection_dropdown.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button_container.dart';
import 'package:nodocs/features/scan/widgets/scan_carousel.dart';
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
            buttonText: 'Save & Exit',
            buttonIcon: Icons.save_outlined,
            onPressed: () async {
              // TODO Write Tags to Database and Save PDF in selected folder

              final pw.Document pdf = await createPDF(<String>[selectedImagePath, selectedImagePath]);

              final String accessToken = await retrieveAccessToken();
              final String assetID = await uploadAsset(pdf, accessToken);
              final String location = await ocrImage(assetID, accessToken);
              await pollAndSaveDocument(location, accessToken);

              // await captureAndCreatePDF(XFile(selectedImagePath));
            }
          ),
        ],
      ),
    );
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
    );
    if (response2.statusCode != 200) {
      throw Exception('${response2.statusCode}: Failed to upload PDF');
    }
    return assetID;
  }

  Future<void> pollAndSaveDocument(final String location, final String accessToken) async {
    Map<String, dynamic> documentStatusAndDownloadUri = await getStatusAndDownloadUri(location, accessToken);
    while (documentStatusAndDownloadUri['status'] == 'in progress') {
      documentStatusAndDownloadUri = await getStatusAndDownloadUri(location, accessToken);
    }
    if (documentStatusAndDownloadUri['status'] == 'done') {
      final String downloadUri = documentStatusAndDownloadUri['asset']['downloadUri'];
      http.Response response = await http.get(
        Uri.parse(downloadUri),
      );
      if (response.statusCode != 200) {
        throw Exception('${response.statusCode}: Failed to OCR Document');
      }
      final Directory directory = await getApplicationDocumentsDirectory();
      final String path = '${directory.path}/downloaded_document.pdf';
      File file = File(path);
      await file.writeAsBytes(response.bodyBytes);
      print("Document saved at: $path");
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
    );
    if (response.statusCode != 200) {
      throw Exception('${response.statusCode}: Failed to poll Document');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<String> ocrImage(final String assetID, final String accessToken) async {
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
}