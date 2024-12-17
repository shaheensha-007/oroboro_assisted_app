import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/UserdetalisModel/UserdetalisModel.dart';

class UserdetalisApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Users_detail';
  Future<UserdetalisModel> postuserdetalisdata(
      String userid, String Identity, BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'OperationType': "Individual",
      'Identity': Identity
    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body), context);
    // print(response.body);
    try {
      final responseFromAPi = UserdetalisModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/Users_detail");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: " gateway/Users_detail Error");
      throw Exception(e.toString());
    }
  }
}
