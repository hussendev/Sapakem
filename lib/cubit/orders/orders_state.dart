part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersError extends OrdersState {
  final String message;

  OrdersError(this.message);
}

class OrderCreated extends OrdersState {
  final ProcessResponse response;

  OrderCreated(this.response);
}

class OrdersSuccessful extends OrdersState {
  final Map<String, List<Order>> orders = {
    'previous': [],
    'current': [],
  };

  OrdersSuccessful(List<Order> orders) {
    for (int i = 0; i < orders.length; i++) {
      if (orders[i].status! == '4' || orders[i].status! == '5') {
        this.orders['previous']!.add(orders[i]);
      } else {
        this.orders['current']!.add(orders[i]);
      }
    }
  }
}

class OrderDetailsSuccessful extends OrdersState {
  final List<OrderDetails> orders;

  OrderDetailsSuccessful(this.orders);
}

enum PayMethod { Cash, Online, none }

class PayWayState extends OrdersState {
  final PayMethod payMethod;

  PayWayState(this.payMethod);
}
