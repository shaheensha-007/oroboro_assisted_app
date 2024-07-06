import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../Ui/Signin/signin_page.dart';
import '../../api_client.dart';
import '../../modeles/verifly_pan_model/Veriflypanmodel.dart';





class VerifypanApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'AgentOnboarding/VerifyPan';

  Future<VerifypanModel> postverifypanData(String clientId,
      String pannumber, String agent, BuildContext context) async {
    var body = {
      "clientID": MainclientId,
      "Pan": pannumber,
      "OnboardingFor": "Agent",
    };

    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body), context);


    if (response.body.isNotEmpty) {
      // Decode JSON only if response is not empty
      Map<String, dynamic> responseBody = json.decode(response.body);
      print(responseBody);
      return VerifypanModel.fromJson(responseBody);

    } else {
      print(response.body);
      return VerifypanModel.fromJson(json.decode(response.body));
      // Handle empty response or invalid JSON
      throw Exception('Empty response or invalid JSON');
    }
  }
}