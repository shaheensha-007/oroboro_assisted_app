import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../../modeles/customeronboradingModel/Personal_informationmodel/Customerdocu_Model/Customerdocu_Model.dart';

class Customerdocu_Api {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/UpdateCustomerDocs';
  Future<CustomerdocuModel> postcustomerdocudata(String userid,String identitytype,String Identity,String applicationid,String doctype,String docbase64,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'IdentityType':identitytype ,
      'Identity':Identity,
      'ApplicationID':applicationid,
      'DocType':doctype,
      'DocBase64':docbase64,

    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = CustomerdocuModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/LOS/UpdateCustomerDocs");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/LOS/UpdateCustomerDocs Error");
      throw Exception(e.toString());
    }
  }

}