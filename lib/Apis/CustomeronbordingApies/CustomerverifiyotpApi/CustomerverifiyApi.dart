import 'dart:convert';

import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import '../../../modeles/customeronboradingModel/CustomerverifiyotpModel/CustomerVerifiyotpModel.dart';

class CustomerverifiyotpApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/VerifyMobileOTP';
  Future<CustomerVerifiyotpModel> postCustomerVerifiyotpdata(String userid,String mobilenumber,String mobileotp) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'MobileNumber':mobilenumber,
      'OTP':mobileotp

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return CustomerVerifiyotpModel.fromJson(json.decode(response.body));
  }

}