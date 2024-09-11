import 'dart:convert';

import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingStatusModel.dart';

class CustomeronbordingApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/OnboardingStatus';
  Future<CustomeronbordingstatusModel> postCustomeronbordingstatusdata(String userid,String customercode) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'Customer_Code':customercode,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return CustomeronbordingstatusModel.fromJson(json.decode(response.body));
  }

}