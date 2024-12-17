import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';

class CustomeronbordingApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/OnboardingStatus';
  Future<CustomeronbordingstatusModel> postCustomeronbordingstatusdata(String userid,String customercode,String partnercode,String agentcode,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'PartnerCode':partnercode,
      'AgentCode':agentcode
    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    try{
    final responseFromAPi = CustomeronbordingstatusModel.fromJson(
        json.decode(response.body));
    log(responseFromAPi.toJson().toString(),
        name: "gateway/Customer/OnboardingStatus");
    if (responseFromAPi.status?.toLowerCase() == "failed") {
      throw Exception(responseFromAPi.errorMessage);
    }
    return responseFromAPi;
  }
  catch (e) {
  log(e.toString(), name: "gateway/Customer/OnboardingStatus Error");
  throw Exception(e.toString());
    }
  }

}