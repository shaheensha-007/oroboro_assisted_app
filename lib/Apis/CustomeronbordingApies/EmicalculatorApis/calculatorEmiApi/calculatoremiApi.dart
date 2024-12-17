import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/EmicalculatorModels/calculatorEmiModel/calculatoremiModel.dart';




class CalculatoremiApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/LoanQuoteCalculator';
  Future<CalculatoremiModel> postCalculatoremidata(String userid,String customercode,String applicationid,String partnercode,String agentcode,String loanamout,String productid,String tenure,String frequency,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode': customercode,
      'ApplicationID': applicationid,
      'PartnerCode': partnercode,
      'AgentCode': agentcode,
      'LoanAmount': loanamout,
      'ProductId': productid,
      'Tenure': tenure,
      'Frequency': frequency
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body), context);
    try{
      final responseFromAPi = CalculatoremiModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/LOS/LoanQuoteCalculator");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/LOS/LoanQuoteCalculator Error");
      throw Exception(e.toString());
    }
  }

}