import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterStates extends Equatable {
  const RegisterStates();

  @override
  List<Object> get props => [];
}

class ChangePasswordVisibilityForPassword extends RegisterStates {
  bool visiblePasswordForPassword;
  IconData suffixForPassword;
  ChangePasswordVisibilityForPassword(
      this.visiblePasswordForPassword, this.suffixForPassword);
  @override
  List<Object> get props =>
      [visiblePasswordForPassword, visiblePasswordForPassword];
}

class ChangePasswordVisibilityForConfirmPassword extends RegisterStates {
  bool visiblePasswordForConfirmPassword;
  IconData suffixForConfirmPassword;
  ChangePasswordVisibilityForConfirmPassword(
      this.visiblePasswordForConfirmPassword, this.suffixForConfirmPassword);
  @override
  List<Object> get props =>
      [visiblePasswordForConfirmPassword, suffixForConfirmPassword];
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
  const ErrorRegisterState(this.message);
}
