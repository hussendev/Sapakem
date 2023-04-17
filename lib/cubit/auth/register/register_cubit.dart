import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/register/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(initialRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  var auth = FirebaseAuth.instance;

  UsersApiController usersApiController = UsersApiController();

  //sign in with phone number

  signInWithPhoneNumber({
    required String phone,
    required BuildContext context,
  }) async {
    emit(LoadingRegisterState());
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+972 59-219-7258',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Logger().i(credential.smsCode);
          // await auth.signInWithCredential(credential);
          // Navigator.pushReplacementNamed(context, '/home_screen');
        },
        verificationFailed: (FirebaseAuthException e) {
          Logger().i("**************");
          Logger().i(e);
          // if (e.code == 'invalid-phone-number') {
          //   emit(ErrorRegisterState("رقم الهاتف غير صحيح"));
          // }
          emit(ErrorRegisterState('something went wrong'));
        },
        codeSent: (String verificationId, int? resendToken) async {
          Logger().i("**************");
          Logger().i(verificationId);
          emit(SuccessRegisterState(true, verificationId));
          Navigator.pushReplacementNamed(context, '/otp_screen');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          Logger().i("**************");
          Logger().i(verificationId);
        },
      );

      Logger().i(phone);
    } catch (e) {
      Logger().i(e);
    }
  }

  // void userRegister({
  //   required UserRegister user,
  //   required BuildContext context,

  // }) async{
  //   emit(LoadingRegisterState());
  //   try{
  //     var response = await usersApiController.register(user);
  //     if(response.success){
  //       emit(SuccessRegisterState(response.success,response.message));
  //       Navigator.pushReplacementNamed(context, '/otp_screen');
  //     }else{
  //       emit(ErrorDataRegisterState(response.message,response.success));
  //     }
  //   }catch(e){
  //     emit(ErrorRegisterState("حدث خطأ ما"));
  //   }
  // }
}
