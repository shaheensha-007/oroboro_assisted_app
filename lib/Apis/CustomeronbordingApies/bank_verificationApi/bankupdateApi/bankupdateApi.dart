import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import '../../../../modeles/customeronboradingModel/bank_verification modeles/bankupadateModel/BankupdateModel.dart';

class BankupdateApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/BankUpdate';
  Future<BankupdateModel> postBankupdatedata(String userid,String customercode,String accountnum, String accounttype,String ifsccode,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'AccountNumber':accountnum,
      'AccountType':accounttype,
      'IFSCCode':ifsccode

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = BankupdateModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/Customer/BankUpdate");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/Customer/BankUpdate Error");
      throw Exception(e.toString());
    }
  }


}