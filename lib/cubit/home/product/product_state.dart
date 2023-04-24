class ProductStates {}

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