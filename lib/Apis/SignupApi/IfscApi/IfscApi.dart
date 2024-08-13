import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../Ui/Signin/signin_page.dart';
import '../../../api_client.dart';
import '../../../modeles/signupModelclass/Ifscmodel/IfscModel.dart';










class IfscApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'AgentOnboarding/IFSCVerify';
  Future<IfscModel> postAgentifscData(String clientId,String ifscnumber,
      BuildContext context) async {


    var body = {
      "clientID": MainclientId,
      "IFSC":ifscnumber,
    };

    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return IfscModel.fromJson(json.decode(response.body));
  }

}