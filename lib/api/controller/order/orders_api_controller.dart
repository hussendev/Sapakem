import 'dart:io';

import 'package:logger/logger.dart';
import 'package:sapakem/api/api_setting.dart';
import 'package:sapakem/api/controller/api_controller.dart';
import 'package:sapakem/model/order.dart' as order;
import 'package:sapakem/prefs/shared_pref_controller.dart';

class OrdersApiController {
  Future<List<order.Order>> getOrders({bool isRefresh = false}) async {
    Logger().i(SharedPrefController().getValueFor<String>(
      PrefKeys.token.name,
    )!);
    var data = await ApiController().get(
      Uri.parse(ApiSettings.getOrders),
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(
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

    for (int i = 0; i < (data!['orders'] as List).length; i++) {
      orders.add(order.Order.fromJson(data['orders'][i]));
    }
    Logger().i(orders);
    return orders;
  }
}
