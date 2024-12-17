import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../../modeles/customeronboradingModel/product_detalisModels/productdetalisModel/ProductdetalisModel.dart';

class ProductdetalisApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/ProductDetails';
  Future<ProductdetalisModel> postproductdetalisdata(String userid,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'Identity':"6/bMWiwsnVg=",
      'OperationType':"Individual",

    };

    Response response = await apiClient_1.invokeAPI(
        trendingpath, 'POST_', jsonEncode(body),context);
    try{
      final responseFromAPi = ProductdetalisModel.fromJson(
          json.decode(response.body));
      log(responseFromAPi.toJson().toString(),
          name: "gateway/ProductDetails");
      if (responseFromAPi.status?.toLowerCase() == "failed") {
        throw Exception(responseFromAPi.errorMessage);
      }
      return responseFromAPi;
    }
    catch (e) {
      log(e.toString(), name: "gateway/ProductDetails Error");
      throw Exception(e.toString());
    }
  }

}