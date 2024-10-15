import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/RestpasswordModel/RestpasswordModel.dart';

class RestpasswordApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/ResetPassword';
  Future<RestpasswordModel> postRestpassworddata(String userid,String password,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'Password': password,
    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return RestpasswordModel.fromJson(json.decode(response.body));
  }

}