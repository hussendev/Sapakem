import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/order/orders_api_controller.dart';
import 'package:sapakem/model/order.dart';
import 'package:sapakem/model/orderDetails.dart';
import 'package:sapakem/model/process_response.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersLoading());
  OrdersApiController controller = OrdersApiController();

  void getOrders({bool isRefresh = false}) async {
    emit(OrdersLoading());
    try {
      List<Order> data = await controller.getOrders(isRefresh: isRefresh);
      emit(OrdersSuccessful(data));
    } catch (e) {
      emit(OrdersError('Error'));
      Logger().e(e);
    }
  }

  void getOrderDetails(String orderId, {bool isRefresh = true}) async {
    emit(OrdersLoading());
    try {
      List<OrderDetails> data = await controller.getOrderDetails(
          orderId: orderId, isRefresh: isRefresh);

      emit(OrderDetailsSuccessful(data));
    } catch (e) {
      emit(OrdersError(e.toString()));
      Logger().e(e);
    }
  }

  getPayWay(PayMethod payMethod) {
    emit(PayWayState(payMethod));
  }

/**
 * 
 * {
        "cart": jsonEncode([
          {
            'merchant_id': 1,
            'products': [
              {'product_id': 2, 'price': 10, 'quantity': 1}
            ]
          }
        ]),
        "payment_type": "Cash",
        "date_received": "2023-03-30",
        "city_id": 1.toString(),
        "hour": "12:34:56"
      }
 */
  createOrder(Map<String, dynamic> data, BuildContext context, int cityId,
      String date, String hour, String paymentType) async {
    Logger().i(convertData(data, cityId, date, hour, paymentType));
    emit(OrdersLoading());

    try {
      ProcessResponse response = await controller.createOrder(
        context,
        convertData(data, cityId, date, hour, paymentType),
      );
    } catch (e) {
      emit(OrdersError(e.toString()));
      Logger().e(e);
    }
  }

  Map<String, dynamic> convertData(Map<String, dynamic> cart, int cityId,
      String date, String hour, String paymentType) {
    List<Map<String, dynamic>> cartItems = [];
    cart.forEach((merchantId, products) {
      List<Map<String, dynamic>> convertedProducts = [];
      for (var product in products) {
        convertedProducts.add({
          'product_id': product['id'],
          'price': product['price_offer'] ?? product['price'],
          'quantity': product['quantity'],
        });
      }
      cartItems.add({
        'merchant_id': int.parse(merchantId),
        'products': convertedProducts,
      });
    });

    Map<String, dynamic> desiredFormat = {
      "cart": jsonEncode(cartItems),
      "payment_type": paymentType,
      "date_received": date,
      "city_id": cityId.toString(),
      "hour": hour
    };

    return desiredFormat;
  }
}
