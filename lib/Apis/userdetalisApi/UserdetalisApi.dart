import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/UserdetalisModel/UserdetalisModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingStatusModel.dart';

class UserdetalisApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Users_detail';
  Future<UserdetalisModel> postuserdetalisdata(String userid,String Identity,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'OperationType':"Individual",
      'Identity':Identity

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return UserdetalisModel.fromJson(json.decode(response.body));
  }

}