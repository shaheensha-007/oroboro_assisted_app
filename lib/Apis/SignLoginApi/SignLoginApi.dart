import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/modeles/SigninModel/SignloginModel/SignloginModel.dart';

import '../../../Ui/Signin/signin_page.dart';
import '../../../api_client.dart';








class SigninApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'Oroboro/Login';
  Future<SignloginModel> postSignlogindata(String userName,String password,
      BuildContext context) async {
    var body = {
      'ClientId': MainclientId,
      'UserName': userName,
      'Password': base64.encode(utf8.encode(password))

    };

    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return SignloginModel.fromJson(json.decode(response.body));
  }

}