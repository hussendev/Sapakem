import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiController {
  static ApiController instance = ApiController._internal();

  ApiController._internal();

  factory ApiController() {
    return instance;
  }

  Map<String, dynamic> cacheData = {};

  Future<Map> get(Uri url, {Map<String, String>? headers, required BuildContext context, int numberOfSecondsToSave = 0, bool withoutToast = false}) async {
    if (cacheData.keys.contains(url.toString())) {
      if (timeIsNotExpires(url)) {
        return cacheData[url.toString()];
      }
    }
    http.Response response = await http.get(url, headers: headers ?? {"Content-Type": "application/json"});
    Map<String, dynamic> data = await jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (numberOfSecondsToSave > 0) {
        cacheData[url.toString()] = data;
        cacheData['${url}cacheTime'] = numberOfSecondsToSave;
        cacheData['${url}saveTime'] = DateTime.now();
      }
      return data;
    } else {
      return data;
    }
  }

  bool timeIsNotExpires(Uri url) {
    DateTime now = DateTime.now();
    DateTime timeExpires = cacheData['${url}saveTime'];
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
