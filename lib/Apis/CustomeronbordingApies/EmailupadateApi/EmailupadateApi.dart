import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../modeles/customeronboradingModel/EmailupadteModel/EmailupdateModel.dart';




class EmailupadateApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/EmailUpdate';
  Future<EmailupdateModel> postEmailupadatedata(String userid,String customercode,String email,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'EmailId':email,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
try{
  final responseFromAPi = EmailupdateModel.fromJson(
      json.decode(response.body));
  log(responseFromAPi.toJson().toString(),
      name: "gateway/Customer/EmailUpdate");
  if (responseFromAPi.status?.toLowerCase() == "failed") {
    throw Exception(responseFromAPi.errorMessage);
  }
  return responseFromAPi;
}
catch (e) {
  log(e.toString(), name: "gateway/Customer/EmailUpdate Error");
  throw Exception(e.toString());
}
  }

}