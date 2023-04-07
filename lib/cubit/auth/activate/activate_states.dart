import 'package:equatable/equatable.dart';

class ActivateState extends Equatable {
  const ActivateState();

  @override
  List<Object> get props => [];
}

class InitialActivate extends ActivateState {}

class LoadingActivate extends ActivateState {}

class SuccessActivate extends ActivateState {
  final String message;
  final bool success;

  SuccessActivate(this.message,this.success);

  @override
  List<Object> get props => [message];
}

class ErrorDataActivate extends ActivateState {
  final String message;
  final bool success;

  ErrorDataActivate(this.message,this.success);

  @override
  List<Object> get props => [message];
}
class ErrorActivate extends ActivateState {
  final String message;
  final bool success;


  ErrorActivate(this.message,this.success);

  @override
  List<Object> get props => [message];
}