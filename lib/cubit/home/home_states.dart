import 'package:equatable/equatable.dart';
import 'package:sapakem/model/home/home_data.dart';

import '../../model/home/merchant.dart';

class HomeStates extends Equatable {
  @override
  List<Object?> get props => [];
}

//start loading states

class LoadingHomeState extends HomeStates {}


class LoadingMerchantByCategoryState extends HomeStates {}
//end loading states

//start success states

class SuccessHomeState extends HomeStates {
  HomeData homeDate;

  SuccessHomeState(this.homeDate);
}

class SuccessMerchantsState extends HomeStates {
  List<Merchant> merchants;

  SuccessMerchantsState(this.merchants);
}



class SuccessMerchantByCategoryState extends HomeStates {
  List<Merchant> merchants;

  SuccessMerchantByCategoryState(this.merchants);
}

// end success states

//start error states


class ErrorHomeState extends HomeStates {
  final String error;

  ErrorHomeState(this.error);
}

class ErrorMerchantByCategoryState extends HomeStates {
  final String error;

  ErrorMerchantByCategoryState(this.error);
}



// end error states
