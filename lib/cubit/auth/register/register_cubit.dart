import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapakem/api/controller/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/login/login_states.dart';
import 'package:sapakem/cubit/auth/register/register_states.dart';
import 'package:sapakem/model/user_register.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(): super(initialRegisterState());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  UsersApiController usersApiController = UsersApiController();

  void userRegister({
    required UserRegister user,
    required BuildContext context,

  }) async{
    emit(LoadingRegisterState());
    try{
      var response = await usersApiController.register(user);
      if(response.success){
        emit(SuccessRegisterState(response.success,response.message));
        Navigator.pushReplacementNamed(context, '/otp_screen');
      }else{
        emit(ErrorDataRegisterState(response.message,response.success));
      }
    }catch(e){
      emit(ErrorRegisterState("حدث خطأ ما"));
    }
  }

}