import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/main.dart';
import 'package:oroboro_assisted_app/modeles/MerchartTokenModel/MerchartTokenModel.dart';


class MerchartTokenApi {
  ApiClient_1 apiClient_1=ApiClient_1();
  String trandingpath='gateway/Auth';
  Future<MerchartTokenModel?> simpletoken(String username, String password) async {

    final body = {
      'username': username,
      'password': password,
    };

    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));

    Response response = await apiClient_1.invokeAPI(trandingpath, 'POST', body,auth: basicAuth);

    return MerchartTokenModel.fromJson(jsonDecode(response.body));
  }
}