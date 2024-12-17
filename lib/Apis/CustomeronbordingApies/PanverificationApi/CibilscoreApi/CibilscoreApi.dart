import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../../modeles/customeronboradingModel/panverificationModel/CIBILscoreModel/CibilscoreModel.dart';




class CilbilscoreApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/CIBILCheck';
  Future<CibilscoreModel> postCibilscoredata(String userid,String customercode,String applicationid,String Pan,String name,String Address,String city,String State,String pincode,String Dob,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'ApplicationID':applicationid,
      'PAN':Pan,
      'Name':name,
      'Address1':Address,
      'City':city,
      'State':State,
      'PinCode':pincode,
      'DOB':Dob,

    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = CibilscoreModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/LOS/CIBILCheck");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/LOS/CIBILCheck Error");
      throw Exception(e.toString());
    }

  }

}