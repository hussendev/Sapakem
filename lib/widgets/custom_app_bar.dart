import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

import 'app_bar_container_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 70.h, bottom: 12.8.h, left: 40.h, right: 30.w),
      height: 129.h,
      width: 430.w,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          AppBarContainerWidget(
              widget: const Icon(Icons.menu, color: Color(0xff1C8ABB)),
              width: 44.w),
          6.pw(),
          AppBarContainerWidget(
              width: 44.w,
              widget:
                  const Icon(Icons.notifications, color: Color(0xff1C8ABB))),
          9.8.pw(),
          AppBarContainerWidget(
              widget: AppText(
                  fontWeight: FontWeight.bold,
                  text: 'الموقع',
                  fontSize: 13.sp,
                  color: const Color(0xff000000)),
              width: 138.w),
          57.1.pw(),
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
