import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/SigninModel/SignloginModel/SignloginModel.dart';

import '../../../Ui/Signin/signin_page.dart';
import '../../../api_client.dart';








class SigninApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Login';
  Future<SignloginModel> postSignlogindata(String userName,String password,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserName': userName,
      'Password': password,
      "Permissions":true
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return SignloginModel.fromJson(json.decode(response.body));
  }

}