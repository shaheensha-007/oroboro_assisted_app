import 'dart:convert';

import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import 'package:oroboro_assisted_app/modeles/FogotpasswordModel/ForgotpasswordModel.dart';

import '../../../modeles/customeronboradingModel/CustomercodeModel/CustomercodeModel.dart';

class CustomercodecreateApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/CodeLookUp';
  Future<CustomercodecreateModel> postCustomercodecreatedata(String userid,String data) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'DataType':"Mobile" ,
      'Data':data,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return CustomercodecreateModel.fromJson(json.decode(response.body));
  }

}