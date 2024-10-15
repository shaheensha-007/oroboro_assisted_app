import 'dart:convert';
import 'dart:developer';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:oroboro_assisted_app/Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_expecption.dart';
import 'main.dart';

class ApiClient_1 {
  Future<Response> invokeAPI(String path, String method, Object? body, BuildContext context, {String? auth}) async {
    final preferences = await SharedPreferences.getInstance();

    final token = preferences.getString('jwttoken');
    Map<String, String> headerParams = {};
    Response response;

    String url = basepath_1 + path;
    print(url);

    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;
    print(body);

    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
            headers: {
              'content-Type': 'application/x-www-form-urlencoded',
              'authorization': auth ?? 'Bearer $token',
            },
            body: body);
        break;
      case "PUT":
        response = await put(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url),
            headers: {
              'authorization': 'Bearer $token',
            },
            body: body);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {
            'authorization': 'Bearer $token',
            'content-Type': 'application/json'
          },
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "GET":
        response = await get(
          Uri.parse(url),
          headers: {
            'authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
        );
        break;
      case "PATCH":
        response = await patch(
          Uri.parse(url),
          headers: {
            'authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          },
          body: body,
        );
        break;
      case "PATCH1":
        response = await patch(
          Uri.parse(url),
          headers: {
            'authorization': 'Bearer $token',
          },
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    }

    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);

    // Check for status codes 400 and 401
    if (response.statusCode == 400 || response.statusCode == 401) {

        BlocProvider.of<MerchartTokenBloc>(context).add(
          FetchMerchartToken(userName: "Test", password:
          "RkQtQTMtRDMtRjctMDktMTItMzItRjQtNDUtQTMtNjItMTMtQUQtQjItQTMtMDY=",ctx: context),
        );

      log(path + ' : ' + response.statusCode.toString() + ' : ' + response.body);
      throw ApiException(_decodeBodyBytes(response), response.statusCode);
    }

    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}
