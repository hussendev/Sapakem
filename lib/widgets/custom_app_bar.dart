// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/cubit/home/product/product_cubit.dart';
import 'package:sapakem/screens/app/home/notification_screen.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

import 'app_bar_container_widget.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, this.isHome = false, required this.title});

  bool isHome;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 70.h,
        bottom: 12.8.h,
        left: context.localizations.language == 'en' ? 30.w : 40.w,
        right: context.localizations.language == 'en' ? 40.w : 30.w,
      ),
      height: 129.h,
      width: 430.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isHome
              ? Row(
                  children: [
                    AppBarContainerWidget(
                      widget: const Icon(Icons.menu, color: Color(0xff1C8ABB)),
                      width: 44.w,
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    6.pw(),
                    AppBarContainerWidget(
                        width: 44.w,
                        widget: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationScreen()),
                              );
                            },
                            icon: const Icon(Icons.notifications,
                                color: Color(0xff1C8ABB)))),
                    9.8.pw(),
                    AppBarContainerWidget(
                        widget: AppText(
                            fontWeight: FontWeight.bold,
                            text: title,
                            fontSize: 13.sp,
                            color: const Color(0xff000000)),
                        width: 138.w),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBarContainerWidget(
                        widget: context.localizations.language == 'en'
                            ? const Icon(Icons.arrow_circle_left_outlined,
                                color: Colors.black)
                            : const Icon(Icons.arrow_circle_right_outlined,
                                color: Colors.black),
                        width: 44.w,onTap: (){
                        ProductCubit.get(context).resetCounter();
                          Navigator.pop(context);
                    }),
                    50.pw(),
                    AppBarContainerWidget(
                        widget: AppText(
                            fontWeight: FontWeight.bold,
                            text: title,
                            fontSize: 13.sp,
                            color: const Color(0xff000000)),
                        width: 138.w),
                  ],
                ),
          SvgPicture.asset(
            'assets/logo_app_bar.svg',
            height: 40.67.h,
            width: 59.87.w,
          ),
        ],
      ),
    );
  }
}
