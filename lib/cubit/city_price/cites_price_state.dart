part of 'cites_price_cubit.dart';

@immutable
abstract class CitesPriceState {}

class CitesPriceInitial extends CitesPriceState {}

class CitesPriceLoadingState extends CitesPriceState {}

class CitesPriceSuccessState extends CitesPriceState {
  final double price;

  CitesPriceSuccessState(this.price);
}
