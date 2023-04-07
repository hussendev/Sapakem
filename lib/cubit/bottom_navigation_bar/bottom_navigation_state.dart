import 'package:equatable/equatable.dart';

class BottomNavigationState extends Equatable {
  final int pageIndex;

  const BottomNavigationState(this.pageIndex);

  @override
  List<Object> get props => [pageIndex];
}

class Home extends BottomNavigationState {
  const Home() : super(0);
}

class Cart extends BottomNavigationState {
  const Cart() : super(1);
}

class Order extends BottomNavigationState {
  const Order() : super(2);
}

class Profile extends BottomNavigationState {
  const Profile() : super(3);
}
