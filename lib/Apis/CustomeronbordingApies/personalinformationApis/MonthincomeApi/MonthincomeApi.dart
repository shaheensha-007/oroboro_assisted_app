import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/api_client_1.dart';

import '../../../../modeles/customeronboradingModel/Personal_informationmodel/MonthIncomeModel/MonthincomeModel.dart';




class MonthincomeApi {
  ApiClient_1 apiClient_1 = ApiClient_1();
  String trendingpath = 'gateway/LOS/UpdateFinancialDetails';
  Future<MonthincomeModel> postMonthincomedata(String userid,String customercode,String employedStatus,String income,String monthlyEmiamount,BuildContext context) async {
    var body = {
      'ApiUserId': "Test",
      'UserId': userid,
      'CustomerCode':customercode,
      'EmploymentStatus':employedStatus,
      'Income':income,
      'MonthlyEMIAmount':monthlyEmiamount

    };

    Response response = await apiClient_1.invokeAPI(
      trendingpath, 'POST_', jsonEncode(body),context);
    print(response.body);
    return MonthincomeModel.fromJson(json.decode(response.body));
  }

}