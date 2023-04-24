import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/cubit/auth/activate/activate_states.dart';
import 'package:sapakem/cubit/home/product/product_state.dart';
import 'package:sapakem/model/home/product.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(InitialProductState());

  static ProductCubit get(context) => BlocProvider.of(context);
  Map<String,dynamic> cart = {};
  // List<Map<String, dynamic>> products = [];

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


  // void addProduct({required Product product}){
  //     products[product.merchantId.toString()] = product.toJson();
  //   emit(SuccessAddProductState(products));
  //
  //
  // }

  void addToCart({required Product product}) {
    emit(LoadingProductState());
    try {
      if (cart.containsKey(product.merchantId.toString())) {
        bool isProductInCart = false;
        List data = cart[product.merchantId.toString()] as List<Map<String, dynamic>>;
        for(int i=0; i<data.length; i++){
          if(data[i]['id'].toString() == product.id.toString()){
            isProductInCart = true;
            emit(AlraedyInCartProductState("this product is already in cart"));
            break;
          }
        }
        if (!isProductInCart) {
          List<Map<String, dynamic>> products = cart[product.merchantId.toString()] ?? [];
          products.add(product.toJson());
          cart[product.merchantId.toString()] = products;
          emit(SuccessAddProductState(cart, 'Add Product Success'));
        }
      }
      else{
        List<Map<String, dynamic>> products = [product.toJson()];
        cart[product.merchantId.toString()] = products;
        emit(SuccessAddProductState(cart,'Add Product Success'));
      }
    } catch (e) {
      emit(ErrorAddProductState('Error Add Product'));
    }
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