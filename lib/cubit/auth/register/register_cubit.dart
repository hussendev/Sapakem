// ignore_for_file: use_build_context_synchronously, invalid_use_of_visible_for_testing_member

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/register/register_states.dart';

import '../../../model/user_register.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(initialRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  var auth = FirebaseAuth.instance;
  String verificationId = '';

  UsersApiController usersApiController = UsersApiController();

  //sign in with phone number

  //change visible password

  bool visiblePasswordForPassword = true;
  bool visiblePasswordForConfirmPassword = true;
  IconData suffixForPassword = Icons.visibility_off_outlined;
  IconData suffixForConfirmPassword = Icons.visibility_off_outlined;
  void changePasswordVisibilityForPassword() {
    Logger().i("message");
    visiblePasswordForPassword = !visiblePasswordForPassword;
    suffixForPassword = visiblePasswordForPassword
        ? Icons.visibility_off_outlined
        : Icons.visibility;

    emit(ChangePasswordVisibilityForPassword(
        visiblePasswordForPassword, suffixForPassword));
  }

  void changePasswordVisibilityForConfirmPassword() {
    Logger().i("message");
    visiblePasswordForConfirmPassword = !visiblePasswordForConfirmPassword;
    suffixForConfirmPassword = visiblePasswordForConfirmPassword
        ? Icons.visibility_off_outlined
        : Icons.visibility;
    // Logger().i(visiblePassword,suffix);

    emit(ChangePasswordVisibilityForConfirmPassword(
        visiblePasswordForConfirmPassword, suffixForConfirmPassword));
  }

  signInWithPhoneNumber({
    required String phone,
    required BuildContext context,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+972$phone',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          Logger().i(e);

          emit(const ErrorRegisterState('something went wrong'));
        },
        codeSent: (String verificationId, int? resendToken) async {
          this.verificationId = verificationId;
          Logger().i(verificationId);
          emit(SuccessRegisterState(true, verificationId));
          Navigator.pushNamed(context, '/activate_screen');
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Logger().i(e);
    }
  }

  void userRegister({
    required UserRegister user,
    required BuildContext context,
  }) async {
    emit(LoadingRegisterState());
    try {
      usersApiController.register(user).then((value) {
        Logger().i(value.success);
        if (value.success) {
          emit(SuccessRegisterState(value.success, value.message));
          // signInWithPhoneNumber(
          //     phone: user.mobile!.toString(), context: context);
        } else {
          emit(ErrorDataRegisterState(value.message, value.success));
        }
      });
      // signInWithPhoneNumber(phone: user.mobile!.toString(), context: context)
      //     .then((_) {

      // });
    } catch (e) {
      emit(const ErrorRegisterState("حدث خطأ ما"));
    }
  }
}
