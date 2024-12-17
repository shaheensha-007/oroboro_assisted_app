import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../../modeles/customeronboradingModel/bank_verification modeles/Ifsc_veriicationModel/IfscverificationModel.dart';

class IfscverificationApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/IFSCVerification';
  Future<IfscverificationModel> postifscverifacationdata(String userid,String ifsccode,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'IFSCCode':ifsccode

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = IfscverificationModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/Customer/IFSCVerification");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/Customer/IFSCVerification Error");
      throw Exception(e.toString());
    }
  }

}