import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_text_field.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
      body: CustomScrollView(
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
                                text: context.localizations.new_password,
                                fontSize: 35.sp,
                                color: const Color(0xff1C8ABB)),
                            8.ph(),
                            AppText(
                                text: context
                                    .localizations.enter_the_new_password,
                                fontSize: 18.sp,
                                color: const Color(0xff222222))
                          ],
                        ),
                        15.ph(),
                        AppTextField(
                            text: context.localizations.password,
                            hinttext: '***********',
                            labeltext: 'labeltext',
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: const Icon(
                              Icons.visibility_off_outlined,
                              size: 25,
                              color: Color(0xff1E2434),
                            ),
                            controller: TextEditingController(),
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
                              color: Color(0xff1E2434),
                            ),
                            obscureText: true),
                        50.ph(),
                        AppButton(
                            text: context.localizations.save, onPressed: () {}),
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
