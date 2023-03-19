import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';

import '../../widgets/app_button_widget.dart';
import '../../widgets/app_text.dart';
import '../../widgets/otp_widget.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

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
                  68.ph(),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 36.w, vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: context.localizations.mobile,
                              fontSize: 35.sp,
                              color: const Color(0xff1C8ABB)),
                          14.ph(),
                          AppText(
                              text: context
                                  .localizations.reset_the_forgotten_password,
                              fontSize: 18.sp,
                              color: const Color(0xff222222)),
                          15.ph(),
                          Form(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                OTPWidget(),
                                OTPWidget(),
                                OTPWidget(),
                                OTPWidget(),
                                OTPWidget(),
                              ],
                            ),
                          ),
                          30.ph(),
                          Row(
                            children: [
                              AppText(
                                  text: context
                                      .localizations.didnot_receive_the_code,
                                  fontSize: 18.sp,
                                  color: const Color(0xff222222)),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  clipBehavior: Clip.none,
                                  onPressed: () {},
                                  child: AppText(
                                      text: context.localizations.resend,
                                      fontSize: 16.sp,
                                      color: const Color(0xff1C8ABB))),
                            ],
                          ),
                          40.ph(),
                          AppButton(
                              text: context.localizations.send,
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
