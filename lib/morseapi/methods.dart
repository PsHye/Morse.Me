import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResponseTranslator {
  final String inputText;
  final String tranlatedText;

  ResponseTranslator({this.inputText, this.tranlatedText});

  factory ResponseTranslator.fromJson(Map<String, dynamic> json) {
    return ResponseTranslator(
      inputText: json['plaintext'],
      tranlatedText: json['morsecode'],
    );
  }
}

Future<ResponseTranslator> translate(String text) async {
  final response =
  await http.get('http://www.morsecode-api.de/encode?string=$text');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('200');
    return ResponseTranslator.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

