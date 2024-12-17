import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import '../../../modeles/customeronboradingModel/customer_regsitrationModel/Customer_regsitrationModel.dart';

class CustomerregsitrationApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/Registration';
  Future<CustomerRegsitrationModel> postCustomerregsitrtiondata(String userid,String data,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'RegistrationType':"Mobile" ,
      'Data':data,
      "AllowMultipleEntry":true,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
     try{
       final responseFromAPi = CustomerRegsitrationModel.fromJson(
           json.decode(response.body));
       log(responseFromAPi.toJson().toString(),
           name: "gateway/LOS/Registration");
       if (responseFromAPi.status?.toLowerCase() == "failed") {
         throw Exception(responseFromAPi.errorMessage);
       }
       return responseFromAPi;
     }
     catch (e) {
       log(e.toString(), name: "gateway/LOS/Registration Error");
       throw Exception(e.toString());
     }
  }

}