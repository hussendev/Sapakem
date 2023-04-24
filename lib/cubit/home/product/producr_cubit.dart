import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapakem/cubit/auth/activate/activate_states.dart';
import 'package:sapakem/cubit/home/product/product_state.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(InitialProductState());

  static ProductCubit get(context) => BlocProvider.of(context);

  int counter=0;
  void increment(){

    counter++;
    emit(IncrementProductState(counter));
  }
  void decrement(){
    if(counter==0){
      return;
    }
    counter--;
    emit(DecrementProductState(counter));
  }




  // void getProducts() {
  //   emit(LoadingProductState());
  //   try {
  //     emit(SuccessProductState());
  //   } catch (e) {
  //     emit(ErrorProductState(e.toString()));
  //   }
  // }
}