import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/api_setting.dart';
import 'package:sapakem/api/controller/api_controller.dart';
import 'package:sapakem/model/order.dart' as order;
import 'package:sapakem/model/orderDetails.dart';
import 'package:sapakem/model/process_response.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';

class OrdersApiController {
  Future<List<order.Order>> getOrders({bool isRefresh = false}) async {
    var data = await ApiController().get(
      Uri.parse(ApiSettings.getOrders),
      headers: {
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(
          PrefKeys.token.name,
        )!,
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json'
      },
      timeToLive: 10,
      withoutToast: true,
      isRefresh: isRefresh,
    );
    Logger().i(data);
    List<order.Order> orders = [];

    for (int i = 0; i < (data!['list'] as List).length; i++) {
      orders.add(order.Order.fromJson(data['list'][i]));
    }
    Logger().i(orders);
    return orders;
  }

  Future<List<OrderDetails>> getOrderDetails(
      {bool isRefresh = false, required String orderId}) async {
    var data = await ApiController().get(
      Uri.parse(ApiSettings.getOrderDetails + orderId),
      headers: {
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(
          PrefKeys.token.name,
        )!,
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json'
      },
      timeToLive: 10,
      withoutToast: true,
      isRefresh: isRefresh,
    );

    Logger().i(data);
    List<OrderDetails> orders = [];

    for (int i = 0; i < (data!['list'] as List).length; i++) {
      orders.add(OrderDetails.fromJson(data['list'][i]));
    }
    Logger().i(orders);
    return orders;
  }

  Future<ProcessResponse> createOrder(
    BuildContext context,
    Map<String, dynamic> body,
  ) async {
    var response = await ApiController().post(
      Uri.parse(ApiSettings.createOrder),
      body: body,
      context: context,
      headers: {
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json',
      },
    );

    Logger().i(response);

    return ProcessResponse(
        message: response['message'], success: response['status']);
  }
}
