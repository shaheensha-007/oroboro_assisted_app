import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../../modeles/customeronboradingModel/product_detalisModels/productcollateral_Model/ProductcollateralModel.dart';


class ProductcollateralApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/Customer/CollateralUpdate';
  Future<ProductcollateralModel> postproductcollateraldata(String userid,String customercode,String applicationid,String productname, String brandname, String modelname,String productvalue,String productid,String addonid,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      "CustomerCode": customercode,
      "ApplicationID":applicationid ,
      "ProductName":productname,
      "BrandName":brandname,
      "ModelName":modelname,
      "ProductValue":productvalue,
      "ProductId":productid,
      "AddOnId":addonid,

    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = ProductcollateralModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/Customer/CollateralUpdate");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/Customer/CollateralUpdate Error");
      throw Exception(e.toString());
    }
  }

}