import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/EmicalculatorModels/EmitenuresendOtpModel/EmitenureModel.dart';

import '../../../../modeles/EmicalculatorModels/LoanbookingModel/LoanbookingModel.dart';




class LoanbookingApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Loan/booking';
  Future<LoanbookingModel> postLoanboookingdata(String userid,String customercode,String applicationid,String PartnerCode,String agentcode,String productid,String tenure,String Emiamount,String frequency,String loanamout,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'ApplicationID':applicationid,
      'PartnerCode':PartnerCode,
      'AgentCode':agentcode,
      'ProductId':productid,
      'Tenure':tenure,
      'EMI':Emiamount,
      'Frequency':frequency,
      'LoanAmount':loanamout,
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi= LoanbookingModel.fromJson(json.decode(response.body));
      log(responseFromAPi.toJson().toString(),name: "gateway/Loan/booking");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);

      }
      return responseFromAPi;
    }catch(e){
      log(e.toString(),name: "gateway/Loan/booking Error");
      print(e);
      throw Future.error("");
    }
  }

}