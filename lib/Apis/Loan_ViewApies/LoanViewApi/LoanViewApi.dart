import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/modeles/Loan_View_Models/LoanViewModel/LoanViewModel.dart';

import '../../../api_client_1.dart';
import '../../../modeles/customeronboradingModel/AadhaarOtpVerificationModel/AadhaarOtpVerificationModel.dart';

class LoanViewApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Loan/view-binding';

  Future<LoanViewModel> postLoanviewdatadata(
      String userid,
      int index,
      int pagesize,
      String groupname,
      String applicationidstatuts,
      String fromdte,
      String todate,
      BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'Index': index,
      'PageSize': pagesize,
      'GroupName': groupname,
      'ApplicationStatus': applicationidstatuts,
      'FromDate':fromdte,
      'ToDate':todate,
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body), context);
    try {
      final responseFromAPi = LoanViewModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/Loan/view-binding");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/Loan/view-binding Error");
      throw Exception(e.toString());
    }
  }
}
