import 'dart:convert';

import 'package:http/http.dart';


import '../../../api_client_1.dart';
import '../../../modeles/customeronboradingModel/AadhaarsendOtpModel/AadhaarsendotpModel.dart';


class AadhaarsendotpApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/SendAadhaarOTP';
  Future<AadhaarsendotpModel> postAadhaarsendOtpdata(String userid,String customercode,String aadhaarno) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode ,
      'Aadhaar':aadhaarno,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return AadhaarsendotpModel.fromJson(json.decode(response.body));
  }

}