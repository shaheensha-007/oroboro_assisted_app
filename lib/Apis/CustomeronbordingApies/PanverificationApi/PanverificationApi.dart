import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../modeles/customeronboradingModel/panverificationModel/PanverificationModel.dart';



class PanverificationApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/PANVerification';
  Future<PanverificationModel> postPanverificationdata(String userid,String customercode,String Pan,String applicationid,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'PAN':Pan,
      'ApplicationID':applicationid,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = PanverificationModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/LOS/PANVerification");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/LOS/PANVerification Error");
      throw Exception(e.toString());
    }
   
  }

}