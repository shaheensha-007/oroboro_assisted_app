import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../Ui/Signin/signin_page.dart';
import '../../../api_client.dart';
import '../../../modeles/signupModelclass/AgentKycModel/AgentKycModel.dart';






class AgentkycApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'AgentOnboarding/AgentKyc';
  Future<AgentKycModel> postagentkycData(String clientId, String Partnercode,String pannumber,
      String mobilenumber, String email, String agent,BuildContext context) async {
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
      "PartnerCode":Partnercode,
      "Pan":pannumber,
      "MObile": mobilenumber,
      "Email":email,
      "OnboardingFor":"Agent",
    };

    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return AgentKycModel.fromJson(json.decode(response.body));
  }

}