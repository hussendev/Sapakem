enum ProcessState { ADD, DELETE, cantBeZero,change, cantBeMoreThanStock,existInCart,errorAddProduct,notAllowed }
class ProductStates {}

class LoadingProductState extends ProductStates {}


class ProcessProductState extends ProductStates {
  Map<String,dynamic> products;
  String message;
  ProcessState processState;
  ProcessProductState(this.products,this.message,this.processState);
}

// class AlraedyInCartProductState extends ProductStates {
//   String message;
//   AlraedyInCartProductState(this.message);
// }

class ChangeQuantityProductState extends ProductStates {
  Map<String,dynamic> products;
  ProcessState processState;
  int quantity;
  ChangeQuantityProductState(this.products,this.processState,this.quantity);
}

class ErrorAddProductState extends ProductStates {
  ProcessState processState;
  String message;
  ErrorAddProductState(this.message,this.processState);
}



class InitialProductState extends ProductStates {
  int counter=0;
}

class IncrementProductState extends ProductStates {
  int counter;

  IncrementProductState(this.counter);
}

class DecrementProductState extends ProductStates {
  int counter;

  DecrementProductState(this.counter);
}

