import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapakem/cubit/bottom_navigation_bar/bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const Home());

  void changePage(int pageIndex) {
    if (pageIndex == 0) {
      emit(const Home());
    } else if (pageIndex == 1) {
      emit(const Cart());
    } else if (pageIndex == 2) {
      emit(const Order());
    } else if (pageIndex == 3) {
      emit(const Profile());
    }
  }
}
