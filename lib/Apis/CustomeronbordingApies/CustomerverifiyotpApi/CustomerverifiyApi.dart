import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import '../../../modeles/customeronboradingModel/CustomerverifiyotpModel/CustomerVerifiyotpModel.dart';

class CustomerverifiyotpApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/VerifyMobileOTP';
  Future<CustomerVerifiyotpModel> postCustomerVerifiyotpdata(String userid,String mobilenumber,String mobileotp,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'MobileNumber':mobilenumber,
      'OTP':mobileotp

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
  try{
    final responseFromAPi = CustomerVerifiyotpModel.fromJson(
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