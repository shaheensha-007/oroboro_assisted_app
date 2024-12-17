import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../modeles/customeronboradingModel/LoanmessageModel/LoanMessageModel.dart';



class LoanmessageApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Loan/Customer/link-dispatch';
  Future<LoanMessageModel> postLoanmessageata(String loanId,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
       'LoanID': loanId,
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = LoanMessageModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/Loan/Customer/link-dispatch");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/Loan/Customer/link-dispatch Error");
      throw Exception(e.toString());
    }

  }

}