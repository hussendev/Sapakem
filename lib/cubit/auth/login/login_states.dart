import 'package:equatable/equatable.dart';

abstract class LoginStates extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class initialLoginState extends LoginStates{

}

class LoadingLoginState extends LoginStates{}

class SuccessLoginState extends LoginStates{
  final String message;
  final bool success;

  SuccessLoginState(this.message,this.success);
}



class ErrorDataLoginState extends LoginStates{
  final String error;
  final bool success;

  ErrorDataLoginState(this.error,this.success);
}


class ErrorLoginState extends LoginStates{
  final String error;
  final bool success;

  ErrorLoginState(this.error,this.success);
}
