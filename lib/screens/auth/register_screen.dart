// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            context.localizations.language == 'en'
                ? Icons.arrow_circle_left_outlined
                : Icons.arrow_circle_right_outlined,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -215.h,
                        child: Container(
                          height: 430.h,
                          width: 430.w,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
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
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: SvgPicture.asset('assets/logo.svg',
                              semanticsLabel: 'A red up arrow'),
                        ),
                      ),
                    ],
                  ),
                ),
                25.ph(),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 36.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            text: context.localizations.create_your_account,
                            fontSize: 35.sp,
                            color: const Color(0xff1C8ABB)),
                        14.ph(),
                        AppText(
                            text: context.localizations
                                .create_a_new_account_for_yourself,
                            fontSize: 18.sp,
                            color: const Color(0xff222222)),
                        21.ph(),
                        SizedBox(
                            height: 108.h,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: AppTextField(
                                      text: context.localizations.first_name,
                                      hinttext: '594  358  404',
                                      labeltext: 'labeltext',
                                      keyboardType: TextInputType.name,
                                      controller: TextEditingController(),
                                      obscureText: false),
                                ),
                                10.pw(),
                                Expanded(
                                  flex: 1,
                                  child: AppTextField(
                                      text: context.localizations.last_name,
                                      hinttext: 'moh',
                                      labeltext: 'labeltext',
                                      keyboardType: TextInputType.name,
                                      controller: TextEditingController(),
                                      obscureText: false),
                                ),
                              ],
                            )

                            // decoration: const BoxDecoration(shape: BoxShape.circle),
                            ),
                        10.ph(),
                        AppTextField(
                            text: context.localizations.mobile,
                            hinttext: "594  358  404",
                            labeltext: 'labeltext',
                            keyboardType: TextInputType.phone,
                            controller: TextEditingController(),
                            obscureText: false),
                        10.ph(),
                        AppTextField(
                            text: context.localizations.password,
                            hinttext: '***********',
                            labeltext: 'labeltext',
                            keyboardType: TextInputType.visiblePassword,
                            controller: TextEditingController(),
                            suffixIcon: const Icon(
                              Icons.visibility_off_outlined,
                              size: 25,
                              color: const Color(0xff1E2434),
                            ),
                            obscureText: true),
                        10.ph(),
                        AppTextField(
                            text: context.localizations.confirm_password,
                            hinttext: '***********',
                            labeltext: 'labeltext',
                            keyboardType: TextInputType.visiblePassword,
                            controller: TextEditingController(),
                            suffixIcon: const Icon(
                              Icons.visibility_off_outlined,
                              size: 25,
                              color: const Color(0xff1E2434),
                            ),
                            obscureText: true),
                        10.ph(),
                        AppTextField(
                            text: context.localizations.address,
                            hinttext: "טול כרם",
                            labeltext: 'labeltext',
                            keyboardType: TextInputType.text,
                            controller: TextEditingController(),
                            obscureText: false),
                        9.ph(),
                        SizedBox(
                          height: 30.h,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Checkbox(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  side: const BorderSide(
                                      color: const Color(0xff1C8ABB)),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ),
                              5.pw(),
                              AppText(
                                  text: context
                                      .localizations.do_you_have_an_account,
                                  fontSize: 15.sp,
                                  color: Color(0xff222222)),
                            ],
                          ),
                        ),
                        25.ph(),
                        AppButton(
                            text: context.localizations.sign_up,
                            onPressed: () {}),
                        29.ph(),
                        Row(
                          children: [
                            AppText(
                                text: context
                                    .localizations.do_you_have_an_account,
                                fontSize: 16.sp,
                                color: const Color(0xff222222)),
                            5.pw(),
                            AppText(
                                text: context.localizations.login,
                                fontSize: 16.sp,
                                color: const Color(0xff1C8ABB)),
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
      ),
    );
  }
}
