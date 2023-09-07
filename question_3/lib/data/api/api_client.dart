import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:question_3/data/api/api_constant.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);
  dynamic get({required String pageNo}) async {
    var url = Uri(
        scheme: "https",
        host: ApiConstants.BASE_URL,
        path: ApiConstants.CHARACTER_PATH,
        queryParameters: {
          "page": pageNo,
        });

    var response = await _client.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
