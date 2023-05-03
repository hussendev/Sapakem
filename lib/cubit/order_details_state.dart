part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsError extends OrderDetailsState {
  final String error;

  OrderDetailsError(this.error);
}

class OrderDetailsSuccess extends OrderDetailsState {
  final List<OrderDetails> orderDetails;

  OrderDetailsSuccess(this.orderDetails);
}
