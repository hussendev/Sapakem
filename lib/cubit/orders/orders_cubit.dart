import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/order/orders_api_controller.dart';
import 'package:sapakem/model/order.dart';
import 'package:sapakem/model/orderDetails.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersLoading());
  OrdersApiController controller = OrdersApiController();

  void getOrders() async {
    emit(OrdersLoading());
    try {
      List<Order> data = await controller.getOrders();
      emit(OrdersSuccessful(data));
    } catch (e) {
      emit(OrdersError('Error'));
      Logger().e(e);
    }
  }

  void getOrderDetails(String orderId) async {
    emit(OrdersLoading());
    try {
      List<OrderDetails> data = await controller.getOrderDetails(orderId: orderId);
      emit(OrderDetailsSuccessful(data));
    } catch (e) {
      emit(OrdersError(e.toString()));
      Logger().e(e);
    }
  }

  getPayWay(PayMethod payMethod) {
    emit(PayWayState(payMethod));
  }

  createOrder(dynamic data, String cityId, String paymentType, BuildContext context) async {
    try {
      List<Map> a = [
        {
          "store_id": 1,
          "address_id": 2,
          "payment_type": "Cash",
          "cart": [
            {"product_id": 992, "quantity": 2},
            {"product_id": 1001, "quantity": 1}
          ]
        },
      ];
      await controller.createOrder(context, a);
    } catch (e) {
      Logger().e(e);
    }
  }
}
