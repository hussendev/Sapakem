// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

import '../../widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            height: 240,
            child: Stack(
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
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // alignment: Alignment.topRight,
                  height: 89,
                  // width: 162,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          text: 'Lets Start',
                          fontSize: 35.sp,
                          color: const Color(0xff1C8ABB)),
                      14.ph(),
                      AppText(
                          text: 'Sign in to your account',
                          fontSize: 18.sp,
                          color: const Color(0xff222222))
                    ],
                  ),
                ),
                24.ph(),
                AppText(
                    text: 'Mobile',
                    fontSize: 16.sp,
                    color: const Color(0xff222222)),
                14.ph(),
                AppTextField(
                    hinttext: '594  358  404',
                    labeltext: 'labeltext',
                    keyboardType: TextInputType.phone,
                    controller: TextEditingController(),
                    obscureText: false),
                11.ph(),
                AppText(
                    text: 'Password',
                    fontSize: 16.sp,
                    color: const Color(0xff222222)),
                14.ph(),
                AppTextField(
                    hinttext: '***********',
                    labeltext: 'labeltext',
                    keyboardType: TextInputType.phone,
                    controller: TextEditingController(),
                    suffixIcon: const Icon(
                      Icons.visibility_off_outlined,
                      size: 25,
                      color: const Color(0xff1E2434),
                    ),
                    obscureText: false),
                10.ph(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                        text: 'Forgot Password?',
                        fontSize: 16.sp,
                        color: const Color(0xff1C8ABB)),
                  ],
                ),
                35.ph(),
                AppButton(text: 'Login', onPressed: () {}),
                // Spacer(),
                120.ph(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        text: 'Don\'t have an account?',
                        fontSize: 16.sp,
                        color: const Color(0xff222222)),
                    10.ph(),
                    AppText(
                        text: 'Sign Up',
                        fontSize: 16.sp,
                        color: const Color(0xff1C8ABB)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  late String text;
  late VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Color.fromARGB(255, 22, 134, 199),
          minimumSize: Size(double.infinity, 60.h)),
      child: AppText(
          text: text,
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500),
    );
  }
}
