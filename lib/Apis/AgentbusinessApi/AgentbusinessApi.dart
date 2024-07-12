import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';



import '../../Ui/Signin/signin_page.dart';
import '../../api_client.dart';
import '../../modeles/AgentbusinessModel/AgentbusinessModel.dart';





class AgentbusinessApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'AgentOnboarding/BusinessRegistration';
  Future<AgentbusinessModel> postagentbusinessData(
      String clientId,
      String pannumber,
      String Partnercode,
      String agent,
      String gstnumber,
      String regsitrationttype,
      String agentname,
      String brandname,
      String tannumber,
      String telephone,
      String signature,
      String latitude,
      String longitude,
      BuildContext context) async {
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
      "PartnerCode":Partnercode,
      "OnboardingFor":"Agent",
      "GSTNumber":gstnumber,
      "RegistrationType":"GST",
      "AgentName":agentname,
      "BrandName":brandname,
      "TANNumber":tannumber,
      "TelephoneNumber": telephone,
      "Signature": signature,
      "Latitude":latitude,
      "Longitude":longitude,

    };

    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return AgentbusinessModel.fromJson(json.decode(response.body));
  }

}