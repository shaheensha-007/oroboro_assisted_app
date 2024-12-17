import 'dart:convert';
import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';


import '../../../api_client_1.dart';
import '../../../modeles/customeronboradingModel/AadhaarsendOtpModel/AadhaarsendotpModel.dart';


class AadhaarsendotpApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/SendAadhaarOTP';
  Future<AadhaarsendotpModel> postAadhaarsendOtpdata(String userid,String customercode,String aadhaarno, String applicationid,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode ,
      'Aadhaar':aadhaarno,
      'ApplicationID':applicationid

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = AadhaarsendotpModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/LOS/SendAadhaarOTP");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
       throw Exception(responseFromAPi.errorMessage??"");
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/LOS/SendAadhaarOTP Error");
      throw Exception(e.toString());
    }
  }

}