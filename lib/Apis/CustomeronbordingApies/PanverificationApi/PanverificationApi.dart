import 'dart:convert';

import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../modeles/customeronboradingModel/panverificationModel/PanverificationModel.dart';



class PanverificationApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/PANVerification';
  Future<PanverificationModel> postPanverificationdata(String userid,String customercode,String Pan) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'PAN':Pan,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return PanverificationModel.fromJson(json.decode(response.body));
  }

}