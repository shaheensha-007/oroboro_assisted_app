import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/modeles/MobileOtpVerifyModel/MobileOtpverifyModel.dart';
import '../../Ui/Signin/signin_page.dart';
import '../../api_client.dart';





class MobileotpverifyApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'AgentOnboarding/MobileOTPVerify';
  Future<MobileOtpverifyModel> postotpData(String clientId,
      String mobilenumber, String otpnumber,String agent,BuildContext context) async {
    // Future<String?> getToken() async {
    //   final preferences = await SharedPreferences.getInstance();
    //   return preferences.getString('Token');
    // }

    //   String? token = await getToken();
    //   if (token != null) {
    //     // You have the token, you can use it here
    //     print('Token: $token');
    //   } else {
    //     // Token is not available
    //   }

    var body = {
      "clientID": MainclientId,
      "MObile": mobilenumber,
      "OTP": otpnumber,
      "OnboardingFor":"Agent",
    };

    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return MobileOtpverifyModel.fromJson(json.decode(response.body));
  }

}