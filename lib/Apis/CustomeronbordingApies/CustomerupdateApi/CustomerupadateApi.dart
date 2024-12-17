import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';

class CustomerupdateApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/UpdateNextProcess';
  Future<UpadatenextprocessModel> postupdatestatusdata(
      String userid,
      String customercode,
      String PartnerCode,
      String Flowid,
      String pageorder,
      String applicationid,
      String pagetype,
      BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'Customer_Code': customercode,
      'PartnerCode': PartnerCode,
      'FlowId': Flowid,
      'PageOrder': pageorder,
      'ApplicationID': applicationid,
      'PageType': pagetype,
    };
    try{
    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body), context);

      final responseFromAPi= UpadatenextprocessModel.fromJson(json.decode(response.body));
      log(responseFromAPi.toJson().toString(),name: "gateway/Customer/UpdateNextProcess");
      if(responseFromAPi.status?.toLowerCase()=="failed"){
        throw Exception(responseFromAPi.errorMessage);
      }

      return responseFromAPi  ;
    }catch(e){
      log(e.toString(),name: "gateway/Customer/UpdateNextProcess Error");
      throw Exception(e.toString());
    }
  }
  }
