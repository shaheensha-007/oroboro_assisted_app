import 'dart:convert';

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
    print(response.body);
    return IfscverificationModel.fromJson(json.decode(response.body));
  }

}