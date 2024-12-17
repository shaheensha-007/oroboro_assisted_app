import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../../../api_client_1.dart';
import '../../../../modeles/customeronboradingModel/AadhaaruploadfilesModel/AadhaaruploadfilesModel.dart';





class AadhaarfileUpload_backApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/Doc_OCR';
  Future<AadhaaruploadfilesModel> postAadhaarbackuploadsdata(String userid,String identitytype,String Identityvalue,String docid_value,String doctype,String docbase64,applicationid,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'IdentityType':identitytype ,
      'IdentityValue':Identityvalue,
      'DocID_Value':docid_value,
      'DocType':doctype,
      'DocBase64':docbase64,
      'ApplicationID':applicationid

    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = AadhaaruploadfilesModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/LOS/Doc_OCR");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/LOS/Doc_OCR Error");
      throw Exception(e.toString());
    }
  }

}