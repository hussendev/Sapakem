import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/login/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(initialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UsersApiController usersApiController = UsersApiController();

  // bool isPassword = true;
  // IconData suffix = Icons.visibility_outlined;
  // void changePasswordVisibility(){
  //   isPassword = !isPassword;
  //   suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  //   emit(ChangePasswordVisibilityState());
  // }

  void userLogin({
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoadingLoginState());
    try {
      var response = await usersApiController.login(mobile: phone, password: password);
      if (response.success) {
        emit(SuccessLoginState(response.message, response.success));
        Navigator.pushReplacementNamed(context, '/home_screen');
      } else {
        emit(ErrorDataLoginState(response.message, response.success));
      }
    } catch (e) {
      Logger().e(e.toString());
      emit(ErrorLoginState(e.toString(), false));
    }
  }
//
}
