import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/app/home_api_controller.dart';
import 'package:sapakem/model/home/home.dart';

import '../../model/home/merchant.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(LoadingHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeApiController homeApiController = HomeApiController();
  int count = 0;

  void getHomeData({bool isRefresh = false,required BuildContext context}) async {
    emit(LoadingHomeState());
    try {
     
      HomeResponse homeResponse =
          await homeApiController.getHomeData(isRefresh: isRefresh,context: context);
      if (homeResponse.homeData != null) {
        emit(SuccessHomeState(homeResponse.homeData!));
      } else {
        Logger().e(homeResponse.message);
        if (homeResponse.message == "api.unauthenticated.") {
          emit(ErrorHomeState("يجب تسجيل الدخول أولا"));
        } else {
          emit(ErrorHomeState("حدث خطأ ما"));
        }
      }
    } catch (e) {
      emit(ErrorHomeState(e.toString()));
    }
  }

  void getMerchantByCategory(int categoryId) async {
    emit(LoadingMerchantByCategoryState());
    try {
      List<Merchant> merchants =
          await homeApiController.getMerchantByCategory(categoryId);
      if (merchants.isNotEmpty) {
        emit(SuccessMerchantByCategoryState(merchants));
      } else {
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

  void getMerchantById(int merchantId, {bool isRefresh = false}) async {
    emit(LoadingMerchantsState());
    try {
      Merchant merchant =
          await homeApiController.getMerchant(merchantId, isRefresh: isRefresh);

      if (merchant.id != null) {
        emit(SuccessMerchantState(merchant));
      } else {
        emit(ErrorMerchantByCategoryState("No Data"));
      }
    } catch (e) {
      emit(ErrorHomeState(e.toString()));
    }
  }
// getStatusForMerchant(BuildContext context, String merchantId) async {
//     try {
//       StatusMerchantFriend response = await homeApiController
//           .getStatusMerchantFriend(context: context, merchantId: merchantId);
//       if (response.status! && response.object != null) {
//         switch (response.object!.status) {
//           case 'Pending':
//             emit(SendRequestForMerchantState(MerchantFreindStatus.pending));
//             break;
//           case 'Accepted':
//             emit(SendRequestForMerchantState(MerchantFreindStatus.freind));
//             break;

//           case 'Rejected':
//             emit(SendRequestForMerchantState(MerchantFreindStatus.notFreind));
//             break;

//           default:
//             emit(SendRequestForMerchantState(MerchantFreindStatus.notFreind));
//         }
//       } else {
//         emit(SendRequestForMerchantState(MerchantFreindStatus.notFreind));
//       }
//     } catch (e) {
//       emit(ErrorMerchantState(e.toString()));
//     }
//   }
//   void sendRequestForMerchant(BuildContext context, String merchantId) async {
//     try {
//       Map<String, dynamic> response = await homeApiController
//           .sendRequestForMerchant(merchantId: merchantId, context: context);
//       if (response['friendrequest'] == true) {
//         emit(SendRequestForMerchantState(MerchantFreindStatus.pending));
//       } else {
//         emit(SendRequestForMerchantState(MerchantFreindStatus.notFreind));
//       }
//     } catch (e) {
//       emit(ErrorMerchantState(e.toString()));
//     }
//   }
}
