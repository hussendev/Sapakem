enum ProcessState { ADD, DELETE}
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

