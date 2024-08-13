import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

import '../../api_client.dart';


class RefreshtokenApi {
  Future<List<String>?> getrefreshToken() async {
    List<String>newTokens=[];
    ApiClient apiClient = ApiClient();
    const tokenUrl = '${basePath}token';
    print(tokenUrl)
    ;    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('Token');
    final refreshtoken = preferences.getString('RefersToken');
    final body = {
      'Refresh_token':refreshtoken,
      'grant_type':'refresh_token',
    };

    print(body);
    final response = await http.post(Uri.parse(tokenUrl), body: body,headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      print("worked");
      final jsonResponse = jsonDecode(response.body);
      final accessToken = jsonResponse['access_token'];
      final refreshToken= jsonResponse['refresh_token'];
      await preferences.setString('Token', accessToken);
      await preferences.setString('RefersToken', refreshToken);
      newTokens.add(accessToken);
      newTokens.add(refreshToken);
      return newTokens;
    } else {
      print('Token request failed with status code: ${response.statusCode}');
      return null;
    }
  }
}