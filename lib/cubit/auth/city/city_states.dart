import 'package:sapakem/model/city.dart';

abstract class CityStates {}

double thePrice = 0;

class CityInitialState extends CityStates {}

class CityLoadingState extends CityStates {}

class CitySuccessState extends CityStates {
  List<City> cities = [];

  CitySuccessState(this.cities);
}

class CitySuccessSelectedState extends CityStates {
  City city;

  CitySuccessSelectedState(this.city);
}

class CityErrorState extends CityStates {
  final String error;
  CityErrorState(this.error);
}
