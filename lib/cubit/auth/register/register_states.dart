import 'package:equatable/equatable.dart';

abstract class RegisterStates extends Equatable {
  const RegisterStates();

  @override
  List<Object> get props => [];
}

class initialRegisterState extends RegisterStates {}

class LoadingRegisterState extends RegisterStates {}

class SuccessRegisterState extends RegisterStates {
  final bool success;
  final String message;

  const SuccessRegisterState(this.success, this.message);
}

class ErrorDataRegisterState extends RegisterStates {
  final String message;
  final bool success;

  const ErrorDataRegisterState(this.message, this.success);
}

class ErrorRegisterState extends RegisterStates {
  final String message;
   ErrorRegisterState(this.message);
}
