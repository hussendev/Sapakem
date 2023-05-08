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
  final List<Order> orders;

  OrdersSuccessful(this.orders);
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
