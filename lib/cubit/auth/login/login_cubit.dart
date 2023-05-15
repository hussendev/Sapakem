import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/login/login_states.dart';

import '../../../model/process_response.dart';
import '../../../prefs/shared_pref_controller.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(initialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UsersApiController usersApiController = UsersApiController();

  // bool visi = true;
  bool visiblePassword = true;
  IconData suffix = Icons.visibility_off_outlined;
  void changePasswordVisibility() {
    Logger().i("message");
    visiblePassword = !visiblePassword;
    suffix = visiblePassword ? Icons.visibility_off_outlined : Icons.visibility;
    // Logger().i(visiblePassword,suffix);

    emit(ChangePasswordVisibilityState(visiblePassword, suffix));
  }

  void userLogin({
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoadingLoginState());
    try {

      ProcessResponse response =
          await usersApiController.login(mobile: phone, password: password);
      if (response.success) {
        emit(SuccessLoginState(response.message, response.success));
      } else {
        emit(ErrorDataLoginState(response.message, response.success));
      }
    } catch (e) {
      Logger().e(e.toString());
      emit(ErrorLoginState(e.toString(), false));
    }
  }
}
/**
 * 
 * 11111117000
 * 
 * 123456
 */
