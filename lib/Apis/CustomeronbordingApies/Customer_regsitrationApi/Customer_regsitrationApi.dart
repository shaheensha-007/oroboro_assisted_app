import 'dart:convert';

import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import '../../../modeles/customeronboradingModel/customer_regsitrationModel/Customer_regsitrationModel.dart';

class CustomerregsitrationApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/Registration';
  Future<Customer_regsitrationModel> postCustomerregsitrtiondata(String userid,String data) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'RegistrationType':"Mobile" ,
      'Data':data,
      "AllowMultipleEntry":true,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return Customer_regsitrationModel.fromJson(json.decode(response.body));
  }

}