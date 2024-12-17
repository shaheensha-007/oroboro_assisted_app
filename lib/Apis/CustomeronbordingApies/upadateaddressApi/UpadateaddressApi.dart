import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';
import '../../../modeles/customeronboradingModel/UpadateaddressModel/UpadateaddaressModel.dart';



class UpadateaddressApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/UpdateAddress';
  Future<UpadateaddressModel> postUpadateaddressdata(String userid,String customercode,String applicationid,String address1,String address2,String address3,String city,String state,String pincode,String district,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'ApplicationID':applicationid,
      'Address1':address1,
      'Address2':address2,
      'Address3':address3,
      'City':city,
      'State':state,
      'PinCode':pincode,
      'District':district,
      'ResidenceStatus':'own'
    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
       try{
         final responseFromAPi = UpadateaddressModel.fromJson(
             json.decode(response.body));
         log(responseFromAPi.toJson().toString(),
             name: "gateway/LOS/UpdateAddress");
         if (responseFromAPi.status?.toLowerCase() == "failed") {
           throw Exception(responseFromAPi.responseMessage);
         }
         return responseFromAPi;
       }
       catch (e) {
         log(e.toString(), name: "gateway/LOS/UpdateAddress Error");
         throw Exception(e.toString());
       }
  }

}