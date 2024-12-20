import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'Blocs/refershtoken_bloc/refreshtoken_bloc.dart';
import 'api_expecption.dart';


class ApiClient {
  Future<Response> invokeAPI(String path, String method, Object? body,BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();

    final token = preferences.getString('Token');
    print("hi$token");
    Map<String, String> headerParams = {};
    Response response;

    String url = basePath + path;
    print(url);

    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;
    print(body);
    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
            headers: {
              'content-Type': 'application/x-www-form-urlencoded',
              'authorization': 'Bearer $token',
              'Authorization': 'Basic $token',
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

    print('status of $path =>${response.statusCode}');
    print(response.body);
    if (response.statusCode == 400|| response.statusCode==401) {

      BlocProvider.of<RefreshtokenBloc>(context).add(FetchRefreshtoken());
      log('$path : ${response.statusCode} : ${response.body}');

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