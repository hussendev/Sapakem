import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapakem/api/controller/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/activate/activate_states.dart';

class ActivateCubit extends Cubit<ActivateState> {
  ActivateCubit(): super(InitialActivate());
  static ActivateCubit get(context)=>BlocProvider.of(context);

  UsersApiController usersApiController = UsersApiController();

  void userActivate({
    required int phone,
    required int code,
    required BuildContext context,
  }) async{
    emit(LoadingActivate());
    try{
      var response = await usersApiController.activate(mobile: phone, code: code);
      if(response.success){
        emit(SuccessActivate(response.message,response.success));
        Navigator.pushReplacementNamed(context, '/login_screen');
      }else{
        emit(ErrorDataActivate(response.message,response.success));
      }
    }catch(e){
      emit(ErrorActivate("حدث خطأ ما",true));
    }
  }






}