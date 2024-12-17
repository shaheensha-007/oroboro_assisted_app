import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/LoanEligableModel/MaxloanCapModel/MaxloancapModel.dart';




class MaxloancapApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/BRE/MaxLoanCap';
  Future<MaxloancapModel> postMaxloancapdata(String userid,String customercode,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = MaxloancapModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/BRE/MaxLoanCap");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/BRE/MaxLoanCap Error");
      throw Exception(e.toString());
    }

  }

}