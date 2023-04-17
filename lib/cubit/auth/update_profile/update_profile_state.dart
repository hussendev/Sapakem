import 'package:equatable/equatable.dart';

class UpdateProfileStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialUpdateProfileState extends UpdateProfileStates {}

class LoadingUpdateProfileState extends UpdateProfileStates {}

class SuccessUpdateProfileState extends UpdateProfileStates {
  final bool success;
  final String message;

  SuccessUpdateProfileState(this.success, this.message);
}

class ErrorUpdateProfileState extends UpdateProfileStates {
  final String message;

  ErrorUpdateProfileState(this.message);
}

class ErrorDataUpdateProfileState extends UpdateProfileStates {
  final String message;
  final bool success;

  ErrorDataUpdateProfileState(this.message, this.success);
}
