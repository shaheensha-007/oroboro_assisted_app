import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../modeles/customeronboradingModel/CustomercodeModel/CustomercodeModel.dart';

class CustomercodecreateApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/CodeLookUp';
  Future<CustomercodecreateModel> postCustomercodecreatedata(String userid,String data,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'DataType':"Mobile" ,
      'Data':data,

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
   try{
     final responseFromAPi = CustomercodecreateModel.fromJson(
         json.decode(response.body));
     log(responseFromAPi.toJson().toString(),
         name: "gateway/Customer/CodeLookUp");
     if (responseFromAPi.status?.toLowerCase() == "failed") {
       throw Exception(responseFromAPi.errorMessage);
     }
     return responseFromAPi;
   }
   catch (e) {
     log(e.toString(), name: "gateway/Customer/CodeLookUp Error");
     throw Exception(e.toString());
   }
  }

}