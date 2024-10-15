import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';


import '../../../api_client_1.dart';
import '../../../modeles/customeronboradingModel/AadhaarOtpVerificationModel/AadhaarOtpVerificationModel.dart';


class AadhaarotpverificationApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/AadhaarOTPVerification';
  Future<AadhaarOtpVerificationModel> postAadhaarotpverificatondata(String userid,String customercode,String aadhaarotp,String requestid,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode ,
      'Otp':aadhaarotp,
       'RequestId':requestid,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return AadhaarOtpVerificationModel.fromJson(json.decode(response.body));
  }

}