import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';


import '../../../api_client_1.dart';
import '../../../modeles/customeronboradingModel/AadhaaruploadfilesModel/AadhaaruploadfilesModel.dart';


class AadhaaruploadfilesApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/Doc_OCR';
  Future<AadhaaruploadfilesModel> postAadhaaruploadfilesdata(String userid,String identitytype,String Identityvalue,String docid_value,String doctype,String docbase64,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'IdentityType':identitytype ,
      'IdentityValue':Identityvalue,
      'DocID_Value':docid_value,
      'DocType':doctype,
       'DocBase64':docbase64
    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return AadhaaruploadfilesModel.fromJson(json.decode(response.body));
  }

}