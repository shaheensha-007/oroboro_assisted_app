import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../main.dart';

class TokenApi {
  Future<List<String>?> getToken(String username, String password) async {
    const tokenUrl = '${basePath}token';
    List<String>tokens=[];
    final body = {
      'username': username,
      'password': base64.encode(utf8.encode(password)),
      'grant_type': 'password',
    };

    final response = await http.post(Uri.parse(tokenUrl), body: body);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final accessToken = jsonResponse['access_token'];
      final refreshToken= jsonResponse['refresh_token'];
      tokens.add(accessToken);
      tokens.add(refreshToken);
      return tokens;
    } else {
      print('Token request failed with status code: ${response.statusCode}');
      return null;
    }
  }
}