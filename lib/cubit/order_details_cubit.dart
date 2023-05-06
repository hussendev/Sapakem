import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sapakem/api/controller/order/orders_api_controller.dart';
import 'package:sapakem/model/orderDetails.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsLoading());
  OrdersApiController controller = OrdersApiController();
}
