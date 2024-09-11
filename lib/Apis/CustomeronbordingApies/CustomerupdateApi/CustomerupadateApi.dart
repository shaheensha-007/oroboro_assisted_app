import 'dart:convert';

import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';

class CustomerupdateApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/UpdateNextProcess';
  Future<UpadatenextprocessModel> postupdatestatusdata(String userid,String customercode,String PartnerCode,String Flowid,String pageorder) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'Customer_Code':customercode,
      'PartnerCode':PartnerCode,
      'FlowId' :Flowid,
      'PageOrder':pageorder
    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),);
    print(response.body);
    return UpadatenextprocessModel.fromJson(json.decode(response.body));
  }

}