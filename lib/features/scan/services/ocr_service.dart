import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pdf/widgets.dart' as pw;

class OcrService {
  static Future<String> retrieveAccessToken() async {
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

  static Future<String> uploadAsset(final pw.Document pdf, final String accessToken) async {
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

  static Future<Uint8List> pollDocument(final String location, final String accessToken, final Logger log) async {
    Map<String, dynamic> documentStatusAndDownloadUri = await getStatusAndDownloadUri(location, accessToken);
    while (documentStatusAndDownloadUri['status'] == 'in progress') {
      log.i("Status: ${documentStatusAndDownloadUri['status']}");
      documentStatusAndDownloadUri = await getStatusAndDownloadUri(location, accessToken);
    }
    if (documentStatusAndDownloadUri['status'] == 'done') {
      log.i("Status: ${documentStatusAndDownloadUri['status']}");
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
      return response.bodyBytes;
    } else {
      throw Exception('Failed to OCR Document');
    }
  }

  static Future<Map<String, dynamic>> getStatusAndDownloadUri(final String location, final String accessToken) async {
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

  static Future<String> ocrDocument(final String assetID, final String accessToken) async {
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
}