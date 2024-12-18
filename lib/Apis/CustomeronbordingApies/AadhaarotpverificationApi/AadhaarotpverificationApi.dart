import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../../api_client_1.dart';
import '../../../modeles/customeronboradingModel/AadhaarOtpVerificationModel/AadhaarOtpVerificationModel.dart';

class AadhaarotpverificationApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/AadhaarOTPVerification';

  Future<AadhaarOtpVerificationModel> postAadhaarotpverificatondata(
      String userid,
      String customercode,
      String aadhaarotp,
      String requestid,
      String applicationid,
      BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode': customercode,
      'Otp': aadhaarotp,
      'RequestId': requestid,
      'ApplicationID': applicationid
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body), context);
    try {
      final responseFromAPi = AadhaarOtpVerificationModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/LOS/AadhaarOTPVerification");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/LOS/AadhaarOTPVerification Error");
      throw Exception(e.toString());
    }
  }
}
