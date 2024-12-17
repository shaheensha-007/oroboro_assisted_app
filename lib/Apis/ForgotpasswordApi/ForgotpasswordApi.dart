import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/FogotpasswordModel/ForgotpasswordModel.dart';

class ForgotpasswordApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/ForgotPassword';
  Future<ForgotpasswordModel> postForgotpassworddata(String userName,String mobile,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserName': userName,
      'MobileNumber': mobile,
    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
   try{
     final responseFromAPi = ForgotpasswordModel.fromJson(
         json.decode(response.body));
     log(responseFromAPi.toJson().toString(),
         name: "gateway/ForgotPassword");
     if (responseFromAPi.status?.toLowerCase() == "failed") {
       throw Exception(responseFromAPi.errorMessage);
     }
     return responseFromAPi;
   }
   catch (e) {
     log(e.toString(), name: " gateway/ForgotPassword rror");
     throw Exception(e.toString());
   }
  }

}