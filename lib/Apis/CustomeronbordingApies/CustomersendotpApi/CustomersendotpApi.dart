import 'dart:convert';

import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/FogotpasswordModel/ForgotpasswordModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/CustomersendotpModel/CustomersendotpModel.dart';

import '../../../modeles/customeronboradingModel/CustomercodeModel/CustomercodeModel.dart';

class CustomersendotpApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/SendMobileOTP';
  Future<CustomersendotpModel> postCustomersendotpdata(String userid,String mobilenumber) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'MobileNumber':mobilenumber,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return CustomersendotpModel.fromJson(json.decode(response.body));
  }

}