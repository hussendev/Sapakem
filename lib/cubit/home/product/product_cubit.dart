import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/api_controller.dart';
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

  void addToCart({required ProductCart productCart, required Product product}) {
    List data = ApiController().cacheData[
            "https://mstore.nahal2.me/api/merchants/${product.merchantId}"]
        ['object']['products'];
    var prod =
        data.where((element) => element['id'] == productCart.id).toList().first;

    emit(LoadingProductState());
    try {
      if (productCart.quantity == 0) {
        emit(ErrorAddProductState(
            'Please Select Quantity', ProcessState.cantBeZero));
        return;
      }
      if (productCart.quantity! > product.quantity!) {
        emit(ErrorAddProductState(
            'Quantity is more than stock', ProcessState.cantBeMoreThanStock));
        return;
      }

      if (cart.containsKey(productCart.merchantId.toString())) {
        bool isProductInCart = false;
        List data = cart[productCart.merchantId.toString()]
            as List<Map<String, dynamic>>;
        for (int i = 0; i < data.length; i++) {
          if (data[i]['id'].toString() == productCart.id.toString()) {
            isProductInCart = true;
            emit(ErrorAddProductState(
                "this product is already in cart", ProcessState.existInCart));
            break;
          }
        }
        if (!isProductInCart) {
          List<Map<String, dynamic>> products =
              cart[productCart.merchantId.toString()] ?? [];
          products.add(productCart.toJson());
          cart[productCart.merchantId.toString()] = products;
          product.quantity = (product.quantity! - productCart.quantity!);
          prod['quantity'] = (prod['quantity']! - productCart.quantity!);
          emit(ProcessProductState(
              cart, 'Add Product Success', ProcessState.ADD));
          emit(InitialProductState());
        }
      } else {
        List<Map<String, dynamic>> products = [productCart.toJson()];
        cart[productCart.merchantId.toString()] = products;
        product.quantity = (product.quantity! - productCart.quantity!);
        prod['quantity'] = (prod['quantity']! - productCart.quantity!);
        emit(
            ProcessProductState(cart, 'Add Product Success', ProcessState.ADD));
        emit(InitialProductState());
      }
      Logger().i(prod);
    } catch (e) {
      emit(ErrorAddProductState(
          'Error Add Product', ProcessState.errorAddProduct));
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
