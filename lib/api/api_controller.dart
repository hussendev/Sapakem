import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiController {
  static ApiController instance = ApiController._internal();

  ApiController._internal();

  factory ApiController() {
    return instance;
  }

  Map<String, dynamic> cacheData = {};

  Future<Map<String,dynamic>?> get(
      Uri url,
      {Map<String, String>? headers,
        int timeToLive = 0,
        bool withoutToast = false
      }) async {
   Logger().i(cacheData.keys.contains(url.toString()));
    if (cacheData.keys.contains(url.toString())) {
      if (timeIsNotExpires(url)) {
        return cacheData[url.toString()];
      }
    }


    // Logger().i(url);
    var response = await http.get(url,headers: headers ?? {"Content-Type": "application/json"});
    var data =await jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      if(response.statusCode !=400) {
        if (timeToLive > 0) {
          cacheData[url.toString()] = data;
          cacheData['${url}cacheTime'] = timeToLive;
          cacheData['${url}saveTime'] = DateTime.now();
        }
        return data;
      }
    }else {
      return data;
    }
    return null;
  }



  bool timeIsNotExpires(Uri url) {
    DateTime now = DateTime.now();
    DateTime timeExpires = cacheData['${url}saveTime'];
    Logger().i(cacheData['${url}saveTime']);
    Logger().i(now);
    Logger().i(now.difference(timeExpires).inMinutes);
    return now.difference(timeExpires).inSeconds > 0;
  }

  Future<Map> post(
      Uri url, {
        Map<String, String>? headers,
        Object? body,
        Encoding? encoding,
        required BuildContext context,
      }) async {
    http.Response response = await http.post(url, headers: headers ?? {"Content-Type": "application/json"}, body: body, encoding: encoding);
    Map<String, dynamic> data = await jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      return data;
    }
  }

  Future<Map> patch(
      Uri url, {
        Map<String, String>? headers,
        Object? body,
        Encoding? encoding,
        required BuildContext context,
      }) async {
    http.Response response = await http.patch(url, headers: headers ?? {"Content-Type": "application/json"}, body: body, encoding: encoding);
    Map<String, dynamic> data = await jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      return data;
    }
  }

  Future<Map> delete(
      Uri url, {
        Map<String, String>? headers,
        Object? body,
        Encoding? encoding,
        required BuildContext context,
      }) async {
    http.Response response = await http.delete(url, headers: headers ?? {"Content-Type": "application/json"}, body: body, encoding: encoding);
    Map<String, dynamic> data = await jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      return data;
    }
  }
}