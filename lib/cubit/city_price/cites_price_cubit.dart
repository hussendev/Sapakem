import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';

part 'cites_price_state.dart';

class CitesPriceCubit extends Cubit<CitesPriceState> {
  UsersApiController usersApiController = UsersApiController();

  CitesPriceCubit() : super(CitesPriceInitial());
  getCitesPrices(List<String> merchants, int city) async {
    emit(CitesPriceLoadingState());
    double price = await usersApiController.getCitiesPrices('$city', merchants);
    emit(CitesPriceSuccessState(price));
  }

  changeCity(int city, List<String> merchants) async {
    emit(CitesPriceLoadingState());
    double price = await usersApiController.getCitiesPrices('$city', merchants);
    emit(CitesPriceSuccessState(price));
  }
}
