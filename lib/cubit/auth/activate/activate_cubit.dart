import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/activate/activate_states.dart';

class ActivateCubit extends Cubit<ActivateState> {
  ActivateCubit() : super(InitialActivate());
  static ActivateCubit get(context) => BlocProvider.of(context);

  UsersApiController usersApiController = UsersApiController();
var auth = FirebaseAuth.instance;
  //sign in with phone number

  void userActivate({
    required int phone,
    required int code,
    required BuildContext context,
  }) async {
    emit(LoadingActivate());
    try {
      var response =
          await usersApiController.activate(mobile: phone, code: code);
      if (response.success) {
        emit(SuccessActivate(response.message, response.success));
        Navigator.pushReplacementNamed(context, '/login_screen');
      } else {
        emit(ErrorDataActivate(response.message, response.success));
      }
    } catch (e) {
      emit(ErrorActivate("حدث خطأ ما", true));
    }
  }


verfiyOtp({required String verificationId,required String smsCode,required BuildContext context}) async {
    try {
       emit(LoadingActivate());
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
                emit(SuccessActivate('تم تفعيل الحساب بنجاح', true));
        Navigator.pushReplacementNamed(context, '/login_screen');
        } else {
        emit(ErrorDataActivate('حدث خطأ ما', false));
        }
      });
    } catch (e) {
      emit(ErrorActivate('حدث خطأ ما', false));
     
    }
  }
  
}
