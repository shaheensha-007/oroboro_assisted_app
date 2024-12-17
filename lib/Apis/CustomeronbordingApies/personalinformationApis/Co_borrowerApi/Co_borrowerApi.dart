import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../../modeles/customeronboradingModel/Personal_informationmodel/Co-borrowerModel/Co_borrowerModel.dart';

class Co_borrowerApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Loan/co-borrower';
  Future<CoBorrowerModel> postcoborrowerdata(String userid,String customercode,String applicationid, List<Map<String,dynamic>>data,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'ApplicationID':applicationid,
      'Data':data
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = CoBorrowerModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/Loan/co-borrower");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/Loan/co-borrower Error");
      throw Exception(e.toString());
    }
  }

}