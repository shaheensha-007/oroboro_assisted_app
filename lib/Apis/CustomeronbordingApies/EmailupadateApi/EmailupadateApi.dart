import 'dart:convert';

import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../modeles/customeronboradingModel/EmailupadteModel/EmailupdateModel.dart';




class EmailupadateApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/EmailUpdate';
  Future<EmailupdateModel> postEmailupadatedata(String userid,String customercode,String email) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'EmailId':email,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return EmailupdateModel.fromJson(json.decode(response.body));
  }

}