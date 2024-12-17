import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/EmicalculatorModels/EmitenuresendOtpModel/EmitenureModel.dart';




class EmitenuresendotpApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/TenureConfirmationOTP';
  Future<EmitenuresendotpModel> postEmitenuresendotpdata(String userid,String customercode,String mobilenumber,String loanamout,String tenure,String emi,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'Mobile': mobilenumber,
      'LoanAmount':loanamout,
      'Tenure':tenure,
      "EMI":emi
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = EmitenuresendotpModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/LOS/TenureConfirmationOTP");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);

      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/LOS/TenureConfirmationOTP Error");
      throw Exception(e.toString());
    }
  }

}