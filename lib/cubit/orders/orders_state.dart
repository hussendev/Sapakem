part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersError extends OrdersState {
  final String message;

  OrdersError(this.message);
}

class OrdersSuccessful extends OrdersState {
  final List<Order> orders;

  OrdersSuccessful(this.orders);
}
