class ProductStates {}

class LoadingProductState extends ProductStates {}


class SuccessAddProductState extends ProductStates {
  Map<String,dynamic> products;
  String message;
  SuccessAddProductState(this.products,this.message);
}

class AlraedyInCartProductState extends ProductStates {
  String message;
  AlraedyInCartProductState(this.message);
}

class ErrorAddProductState extends ProductStates {
  String message;
  ErrorAddProductState(this.message);
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

