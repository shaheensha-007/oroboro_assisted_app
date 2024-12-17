import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/SigninModel/SignloginModel/SignloginModel.dart';

class SigninApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Login';
  Future<SignloginModel> postSignlogindata(
      String userName, String password, BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserName': userName,
      'Password': password,
      "Permissions": true
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body), context);
    try {
      final responseFromAPi = SignloginModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/Login");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: " gateway/Login  Error");
      throw (e.toString());
    }
  }
}
