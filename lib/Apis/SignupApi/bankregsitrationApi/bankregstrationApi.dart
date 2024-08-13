import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../Ui/Signin/signin_page.dart';
import '../../../api_client.dart';
import '../../../modeles/signupModelclass/bank_registrationModel/Bank_registratioModel.dart';












class BankregstrationApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'AgentOnboarding/BankVerification';
  Future<BankRegistratioModel> postAgentbankverificationData(
      String clientId,
      String pannumber,
      String Partnercode,
      String agent,
      String accountnum,
      String ifscnumber,
      String accounttype,
      String bankName,
      String branchName,
      String accountholderName,
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
      "AccountNumber":accountnum,
      "IFSCCode":ifscnumber,
      "AccountType":accounttype,
      "BankName": bankName,
      "BranchName":branchName,
      "AccountHolderName":accountholderName,
    };

    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return BankRegistratioModel.fromJson(json.decode(response.body));
  }

}