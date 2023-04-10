import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/app/home_api_controller.dart';
import 'package:sapakem/model/home/home.dart';

import '../../model/home/home_data.dart';
import '../../model/home/merchant.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(LoadingHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeApiController homeApiController = HomeApiController();


  void getHomeData()async {
    emit(LoadingHomeState());
    try {
      HomeResponse homeResponse = await homeApiController.getHomeData();
      if(homeResponse.homeData!=null){
      emit(SuccessHomeState(homeResponse.homeData!));
      }else{
      emit(ErrorHomeState("حدث خطأ ما"));
      }

    } catch (e) {
      emit(ErrorHomeState(e.toString()));
    }

  }


  void getMerchantByCategory(int categoryId)async {
    emit(LoadingMerchantByCategoryState());
    try {
      List<Merchant> merchants = await homeApiController.getMerchantByCategory(categoryId);
      Logger().i(merchants);
      if(merchants.length!=0){
        emit(SuccessMerchantByCategoryState(merchants));
      }else{
        emit(ErrorMerchantByCategoryState("No Data"));
      }

    } catch (e) {
      emit(ErrorHomeState(e.toString()));
    }

  }

  // void getMerchants()async {
  //   emit(LoadingMerchantsState());
  //   try {
  //     List<Merchant> merchants = await homeApiController.getMerchants();
  //     Logger().i(merchants);
  //     if(merchants.length!=0){
  //       emit(SuccessMerchantsState(merchants));
  //     }else{
  //       emit(ErrorMerchantByCategoryState("No Data"));
  //     }
  //
  //   } catch (e) {
  //     emit(ErrorHomeState(e.toString()));
  //   }
  //
  // }

  void getMerchant(int merchantId)async {
    emit(LoadingMerchantsState());
    try {
      Merchant merchant = await homeApiController.getMerchant(merchantId);

      if(merchant.id!=null){
        emit(SuccessMerchantState(merchant));
      }else{
        emit(ErrorMerchantByCategoryState("No Data"));
      }

    } catch (e) {
      emit(ErrorHomeState(e.toString()));
    }

  }


}