import 'dart:convert';
import 'package:chatgpt/core/utils/constants/api_const.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<dynamic>> getData(
      {String? url, Map<String, String>? headers}) async {
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl$url',
      ),
      headers: headers ??
          {
            'Content-Type': 'application/json; charset=utf-8',
            'Authorization': 'Bearer $openAIKey',
          },
    );
    if (response.statusCode == 200) {
      // List<dynamic> data = jsonDecode(response.body)['data'];
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      return data;
    } else {
      throw Exception(
          'There is Problem with Status Code ${response.statusCode}');
    }
  }

  Future<String> postData({
    String? url,
    Map<String, String>? headers,
    String? modelName,
    required String query,
  }) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl$url'),
      headers: headers ??
          {
            'Content-Type': 'application/json; charset=utf-8',
            'Authorization': 'Bearer $openAIKey',
          },
      body: utf8.encode(
        jsonEncode(
          {
            'model': modelName ?? "gpt-3.5-turbo-1106",
            'messages': [
              {
                'role': 'assistant',
                'content': query,
              }
            ],
          },
        ),
      ),
    );

    if (response.statusCode == 200) {
      var content =
          // await jsonDecode(response.body)['choices'][0]['message']['content'];
          await jsonDecode(utf8.decode(response.bodyBytes))['choices'][0]
              ['message']['content'];
      return content;
    } else {
      throw Exception(
          'There is Problem with Status Code ${response.statusCode}');
    }
  }
}
