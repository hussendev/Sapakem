import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/model/home/merchant.dart';

import '../../../api/controller/app/home_api_controller.dart';
import '../../../model/home/status_merchant.dart';
import 'merchant_states.dart';

class MerchantCubit extends Cubit<MerchantStates> {
  MerchantCubit() : super(InitialMerchantState());
  bool isFavorite = false;
  // List<int> favoriteMerchants = [];
  Map<int, dynamic> favoriteMerchants = {};
  HomeApiController homeApiController = HomeApiController();

  static MerchantCubit get(context) => BlocProvider.of(context);

  Future<List<Merchant>> getMerchantsFavorite() async {
    emit(LoadingMerchantState());
    try {
      List<Merchant> merchants = [];
      favoriteMerchants.forEach((key, value) {
        merchants.add(value);
      });
      if (merchants.isNotEmpty) {
        emit(SuccessLoadedMerchantState(merchants));
        return merchants;
      } else {
        emit(FavoriteMerchantEmptyState("No Data"));
        return [];
      }
    } catch (e) {
      emit(ErrorMerchantState(e.toString()));
    }
    return [];
  }

  void changeFavorite() {
    isFavorite = !isFavorite;
    emit(FavoriteMerchantState(isFavorite));
  }

  void addMerchantToFavorites(Merchant merchant) {
    if (isMerchantFavorite(merchant)) {
      favoriteMerchants.remove(merchant.id);
      Logger().i(favoriteMerchants);
      changeFavorite();
      getMerchantsFavorite();
    } else {
      favoriteMerchants[merchant.id!] = merchant;
      changeFavorite();
      // getMerchantsFavorite();
    }
  }

  bool isMerchantFavorite(Merchant merchant) {
    return favoriteMerchants.containsKey(merchant.id);
  }

  void sendRequestForMerchant(BuildContext context, String merchantId) async {
    try {
      Map<String, dynamic> response = await homeApiController
          .sendRequestForMerchant(merchantId: merchantId, context: context);
      if (response['friendrequest'] == true) {
        emit(SendRequestForMerchantState(MerchantFreindStatus.pending));
      } else {
        emit(SendRequestForMerchantState(MerchantFreindStatus.notFreind));
      }
    } catch (e) {
      emit(ErrorMerchantState(e.toString()));
    }
  }

  getStatusForMerchant(BuildContext context, String merchantId) async {
    try {
      emit(LoadingMerchantState());
      StatusMerchantFriend response = await homeApiController
          .getStatusMerchantFriend(context: context, merchantId: merchantId);
      if (response.status! && response.object != null) {
        switch (response.object!.status) {
          case 'Pending':
            emit(SendRequestForMerchantState(MerchantFreindStatus.pending));
            break;
          case 'Accepted':
            emit(SendRequestForMerchantState(MerchantFreindStatus.freind));
            break;

          case 'Rejected':
            emit(SendRequestForMerchantState(MerchantFreindStatus.notFreind));
            break;

          default:
            emit(SendRequestForMerchantState(MerchantFreindStatus.notFreind));
        }
      } else {
        emit(SendRequestForMerchantState(MerchantFreindStatus.notFreind));
      }
    } catch (e) {
      emit(ErrorMerchantState(e.toString()));
    }
  }
}
