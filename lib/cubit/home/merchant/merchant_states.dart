import 'package:equatable/equatable.dart';

import '../../../model/home/merchant.dart';

class MerchantStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialMerchantState extends MerchantStates {}

class LoadingMerchantState extends MerchantStates {}
class SuccessLoadedMerchantState extends MerchantStates {
  SuccessLoadedMerchantState(this.merchants);

  List<Merchant> merchants;

  @override
  List<Object?> get props => [merchants];
}

class FavoriteMerchantEmptyState extends MerchantStates {
  FavoriteMerchantEmptyState(this.message);

  String message;

  @override
  List<Object?> get props => [message];
}
class ErrorMerchantState extends MerchantStates {
  ErrorMerchantState(this.error);

  String error;

  @override
  List<Object?> get props => [error];
}



class InitialFavoriteMerchantState extends MerchantStates {}

class FavoriteMerchantState extends MerchantStates {
  FavoriteMerchantState(this.isFavorite);

  bool isFavorite;

  @override
  List<Object?> get props => [isFavorite];
}