import 'dart:convert';

import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/FogotpasswordModel/ForgotpasswordModel.dart';

class ForgotpasswordApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/ForgotPassword';
  Future<ForgotpasswordModel> postForgotpassworddata(String userName,String mobile) async {
    var body = {
      'ApiUserId': "Test",
      'UserName': userName,
      'MobileNumber': mobile,
    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return ForgotpasswordModel.fromJson(json.decode(response.body));
  }

}