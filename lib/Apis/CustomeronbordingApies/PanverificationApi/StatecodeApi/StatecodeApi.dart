import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/panverificationModel/StatecodeModel/StatecodeModel.dart';





class StatecodeApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Common/states';
  Future<StatecodeModel> postStatecodedata(BuildContext context) async {
    var body = {};

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = StatecodeModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/Common/states");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/Common/states Error");
      throw Exception(e.toString());
    }

  }

}