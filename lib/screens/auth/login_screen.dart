// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/cubit/auth/login/login_cubit.dart';
import 'package:sapakem/cubit/auth/login/login_states.dart';
import 'package:sapakem/util/context_extenssion.dart' as c;
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            context.localizations.language == 'en'
                ? Icons.arrow_circle_left_outlined
                : Icons.arrow_circle_right_outlined,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit,LoginStates>(
          builder: (context, state) {
            if(state is LoadingLoginState){
              return Center(child: CircularProgressIndicator());
            }
            else if(state is SuccessLoginState || state is ErrorDataLoginState || state is initialLoginState){
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          // height: 270.h,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -215.h,
                                child: Container(
                                  height: 430.h,
                                  width: 430.w,
                                  // ignore: prefer_const_constructors
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(200),
                                      bottomRight: Radius.circular(200),
                                    ),
                                    color: Colors.blue,
                                    // shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 170.h,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 100.h,
                                  width: 100.w,
                                  // ignore: sort_child_properties_last
                                  child: SvgPicture.asset('assets/logo.svg',
                                      semanticsLabel: 'A red up arrow'),

                                  // ignore: prefer_const_constructors
                                  decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 36.w, vertical: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                        text: context.localizations.lets_start,
                                        fontSize: 35.sp,
                                        color: const Color(0xff1C8ABB)),
                                    14.ph(),
                                    AppText(
                                        text: context
                                            .localizations.sing_in_to_your_account,
                                        fontSize: 18.sp,
                                        color: const Color(0xff222222))
                                  ],
                                ),
                                24.ph(),
                                AppTextField(
                                    text: context.localizations.mobile,
                                    hinttext: '594  358  404',
                                    labeltext: 'labeltext',
                                    keyboardType: TextInputType.phone,
                                    controller: _phoneController,
                                    obscureText: false),
                                11.ph(),
                                AppTextField(
                                    text: context.localizations.password,
                                    hinttext: '***********',
                                    labeltext: 'labeltext',
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: _passwordController,
                                    suffixIcon: const Icon(
                                      Icons.visibility_off_outlined,
                                      size: 25,
                                      color: const Color(0xff1E2434),
                                    ),
                                    obscureText: true),
                                10.ph(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/forgot_password_screen');
                                      },
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(50, 30),
                                          tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerLeft),
                                      child: AppText(
                                          text: context.localizations.forgot_password,
                                          fontSize: 16.sp,
                                          color: const Color(0xff1C8ABB)),
                                    ),
                                    // TextButton(
                                    //   style:
                                    //   onPressed: () {},
                                    //   child:
                                    // )
                                  ],
                                ),
                                35.ph(),
                                AppButton(
                                    text: context.localizations.login,
                                    onPressed: () {
                                      _performLogin(context);
                                    }),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                        text:
                                        context.localizations.dont_have_an_account,
                                        fontSize: 16.sp,
                                        color: const Color(0xff222222)),
                                    10.ph(),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        clipBehavior: Clip.none,
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/register_screen');
                                        },
                                        child: AppText(
                                            text: context.localizations.sign_up,
                                            fontSize: 16.sp,
                                            color: const Color(0xff1C8ABB))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
            else{
              state as ErrorLoginState;
              return Center(child: Text(state.error.toString()));
            }
          },
          listener: (context, state) {
            if(state is ErrorDataLoginState){
              context.showSnackBar(message: state.error.toString(), error:  !state.success);
            }else if(state is ErrorLoginState){
              context.showSnackBar(message: state.error.toString(), error:  !state.success);
            }else if(state is SuccessLoginState){
              Navigator.pushNamedAndRemoveUntil(context, '/home_screen', (route) => false);
            }
          },
          buildWhen: (previous, current) {
            if(current is ErrorDataLoginState || current is LoadingLoginState || current is SuccessLoginState){
              return true;
            }else{
              return false;
            }
          },
        ),
      )
    );
  }
  //
  void _performLogin(BuildContext context) {
    if (_checkData( context)) {
      _login(context);
    }
  }
  bool _checkData(BuildContext context) {
    if (
      _phoneController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty
    ) {
      return true;
    }
    context.showSnackBar( message: 'Enter Required Data!', error: true);
    return false;
  }

  void _login(BuildContext context) async {
    LoginCubit.get(context).userLogin(phone: _phoneController.text,password:_passwordController.text , context: context);
  }
  //

}
