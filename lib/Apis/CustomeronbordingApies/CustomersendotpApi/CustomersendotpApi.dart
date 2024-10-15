import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/CustomersendotpModel/CustomersendotpModel.dart';


class CustomersendotpApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/SendMobileOTP';
  Future<CustomersendotpModel> postCustomersendotpdata(
      String userid, String mobilenumber,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'MobileNumber': mobilenumber,
    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    return CustomersendotpModel.fromJson(json.decode(response.body));
  }
}
