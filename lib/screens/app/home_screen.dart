import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/home_merchant_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: EdgeInsets.only(
                left: context.localizations.language == 'en' ? 0.h : 15.w,
                right: context.localizations.language == 'en' ? 15.w : 0.h,
              ),
              child: Column(
                children: [
                  23.5.ph(),
                  SizedBox(
                    height: 51.25.h,
                    // width: 413.w,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right:
                            context.localizations.language == 'en' ? 0 : 24.9.w,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(23.r),
                            ),
                            margin: EdgeInsets.only(left: 10.w),
                            width: 112.33.w,
                            height: 51.25.h,
                          );
                        },
                      ),
                    ),
                  ),
                  54.2.ph(),
                  Container(
                    height: 184.h,
                    decoration: const BoxDecoration(
                      color: Color(0xff1C8ABB),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: 358.w,
                  ),
                  34.ph(),
                  SizedBox(
                    height: 33.h,
                    width: 353.11.w,
                    child: Row(
                      children: [
                        AppText(
                            text: 'הארוחות העיקריות',
                            fontSize: 21.sp,
                            color: Colors.blue),
                        const Spacer(),
                        SizedBox(
                          height: 20.04.h,
                          // width: 68.w,
                          child: Row(
                            children: [
                              AppText(
                                  text: 'להראות יותר',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: Colors.black),
                              5.pw(),
                              const Icon(Icons.arrow_forward_ios,
                                  color: Colors.black, size: 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  9.ph(),
                  SizedBox(
                    height: 83.h,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right:
                            context.localizations.language == 'en' ? 0 : 24.9.w,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            margin: EdgeInsets.only(left: 13.w),
                            width: 65.w,
                            height: 65.h,
                          );
                        },
                      ),
                    ),
                  ),
                  17.ph(),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffFF6C6C),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 110.h,
                    width: 358.w,
                  ),
                  36.ph(),
                  const HomeMerchantCategory(),
                  4.ph(),
                  const HomeMerchantCategory(),
                  4.ph(),
                  const HomeMerchantCategory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
