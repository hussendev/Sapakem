import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:sapakem/api/controller/order/orders_api_controller.dart';
import 'package:sapakem/model/order.dart';

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
}
