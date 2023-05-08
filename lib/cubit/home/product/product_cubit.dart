import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/api_controller.dart';
import 'package:sapakem/cubit/home/merchant/merchant_cubit.dart';
import 'package:sapakem/cubit/home/product/product_state.dart';
import 'package:sapakem/model/home/product.dart';
import 'package:sapakem/model/home/product_cart.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(InitialProductState());

  static ProductCubit get(context) => BlocProvider.of(context);
  Map<String, dynamic> cart = {};

  late Product product;

  // List<Map<String, dynamic>> products = [];

  int quantity = 0;

  void resetCounter() {
    quantity = 0;
  }

  void increment() {
    quantity++;
    emit(IncrementProductState(quantity));
  }

  void decrement() {
    if (quantity == 0) {
      return;
    }
    quantity--;
    emit(DecrementProductState(quantity));
  }

  // void addProduct({required Product product}){
  //     products[product.merchantId.toString()] = product.toJson();
  //   emit(SuccessAddProductState(products));
  //
  //
  // }

  void addToCart(
      {required ProductCart productCart,
      required Product product,
      required BuildContext context,
      required String userId}) {
    bool isExist = MerchantCubit.get(context)
        .merchantsFriend
        .where((element) => element == product.merchantId.toString())
        .toList()
        .isNotEmpty;
    if (!isExist) {
      emit(ErrorAddProductState(
          'You cannot buy from this merchant', ProcessState.notAllowed));
      return;
    }

    // Create a user-specific cart for the given userId
    Map<String, dynamic> userCart = cart[userId] as Map<String, dynamic>? ?? {};

    List data = ApiController().cacheData[
            "https://mstore.nahal2.me/api/merchants/${product.merchantId}"]
        ['object']['products'];
    var prod =
        data.where((element) => element['id'] == productCart.id).toList().first;

    emit(LoadingProductState());
    try {
      if (productCart.quantity == 0) {
        emit(ErrorAddProductState(
            'Please select quantity', ProcessState.cantBeZero));
        return;
      }
      if (productCart.quantity! > product.quantity!) {
        emit(ErrorAddProductState(
            'Quantity is more than stock', ProcessState.cantBeMoreThanStock));
        return;
      }

      if (userCart.containsKey(productCart.merchantId.toString())) {
        bool isProductInCart = false;
        List<Map<String, dynamic>> cartItems =
            userCart[productCart.merchantId.toString()]
                as List<Map<String, dynamic>>;

        Logger().i(cartItems);
        for (int i = 0; i < cartItems.length; i++) {
          if (cartItems[i]['id'].toString() == productCart.id.toString()) {
            isProductInCart = true;
            emit(ErrorAddProductState('This product is already in the cart',
                ProcessState.existInCart));
            break;
          }
        }
        if (!isProductInCart) {
          List<Map<String, dynamic>> products =
              userCart[productCart.merchantId.toString()] ?? [];
          products.add(productCart.toJson());
          userCart[productCart.merchantId.toString()] = products;
          product.quantity = (product.quantity! - productCart.quantity!);
          prod['quantity'] = (prod['quantity']! - productCart.quantity!);
          emit(ProcessProductState(
              cart, 'Add Product Success', ProcessState.ADD));
          emit(InitialProductState());
        }
      } else {
        List<Map<String, dynamic>> products = [productCart.toJson()];
        userCart[productCart.merchantId.toString()] = products;
        product.quantity = (product.quantity! - productCart.quantity!);
        prod['quantity'] = (prod['quantity']! - productCart.quantity!);
        emit(
            ProcessProductState(cart, 'Add Product Success', ProcessState.ADD));
        emit(InitialProductState());
      }
      Logger().i(prod);

      // Update the cart for the given userId
      cart[userId] = userCart;
    } catch (e) {
      emit(ErrorAddProductState(
          'Error adding product', ProcessState.errorAddProduct));
    }
  }

  bool isExitInCart(int id, int merchantId) {
    bool isExit = false;
    if (cart.containsKey(merchantId.toString())) {
      List data = cart[merchantId.toString()] as List<Map<String, dynamic>>;
      for (int i = 0; i < data.length; i++) {
        if (data[i]['id'].toString() == id.toString()) {
          isExit = true;
          break;
        }
      }
    } else {
      isExit = false;
    }
    return isExit;
  }

  Product getProduct(int id) {
    Product product = Product();

    return product;
  }

  void removeMerchantFromCart(int merchantId) {
    List dataInCash = ApiController()
            .cacheData["https://mstore.nahal2.me/api/merchants/$merchantId"]
        ['object']['products'];
    // Logger().i(dataInCash.where((element) => element['id'] == productId));
    List data = cart[merchantId.toString()] as List<Map<String, dynamic>>;
    for (int i = 0; i < data.length; i++) {
      var prod = dataInCash
          .where((element) => element['id'] == data[i]['id'])
          .toList()
          .first;

      prod['quantity'] = (prod['quantity']! + data[i]['quantity']);
    }

    cart.remove(merchantId.toString());
    emit(ProcessProductState(
        cart, 'Remove Merchant Success', ProcessState.DELETE));
  }

  void removeProductFromCart(int productId, int merchantId) {
    List dataInCash = ApiController()
            .cacheData["https://mstore.nahal2.me/api/merchants/$merchantId"]
        ['object']['products'];
    var prod = dataInCash
        .where((element) => element['id'] == productId)
        .toList()
        .first;
    List data = cart[merchantId.toString()] as List<Map<String, dynamic>>;
    if (data.length == 1) {
      removeMerchantFromCart(merchantId);
      emit(ProcessProductState(
          cart, 'Remove Product Success', ProcessState.DELETE));
      return;
    }
    for (int i = 0; i < data.length; i++) {
      // Logger().i(data[i]['id'].toString() == id.toString());
      if (data[i]['id'].toString() == productId.toString()) {
        prod['quantity'] = (prod['quantity']! + data[i]['quantity']);
        // Logger().i(data[i]['quantity']);
        data.removeAt(i);
        break;
      }
    }
    cart[merchantId.toString()] = data;
    emit(ProcessProductState(
        cart, 'Remove Product Success', ProcessState.DELETE));
  }
}

/*

{
"1" : [],
"2" : [],
"userId":2
}
 */
