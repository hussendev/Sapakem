// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/city/city_states.dart';

import '../../../model/city.dart';

class CityCubit extends Cubit<CityStates> {
  UsersApiController usersApiController = UsersApiController();
  CityCubit() : super(CityInitialState());

  int cityId = 0;

  static CityCubit get(context) => BlocProvider.of(context);

  List<City> cities = [];

  getCities() async {
    emit(CityLoadingState());
    cities = await usersApiController.getCities();
    if (cities.isNotEmpty) {
      emit(CitySuccessState(cities));
    } else {
      emit(CityErrorState('No Cities Found'));
    }
  }

  ChangeCity(City city) {
    cityId = city.id!;
    cities.where((element) => element.id == cityId).first;
    emit(CitySuccessState(cities));
  }
}
