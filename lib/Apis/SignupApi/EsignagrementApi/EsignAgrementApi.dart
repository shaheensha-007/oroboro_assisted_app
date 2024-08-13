import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../Ui/Signin/signin_page.dart';
import '../../../api_client.dart';
import '../../../modeles/signupModelclass/EsignagreementModel/EsignagreementModel.dart';











class EsignagreementApi{
  ApiClient apiClient = ApiClient();
  String trendingpath = 'AgentOnboarding/EsignAgreement';
  Future<EsignagreementModel> postAgentesignData(String clientId,String pannumber,
      String agent,BuildContext context) async {
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
      "Pan":pannumber,
      "OnboardingFor":"Agent",
    };

    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return EsignagreementModel.fromJson(json.decode(response.body));
  }

}