// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/sized_box_extension.dart';

import '../app_text.dart';

class ProfileInformationWidget extends StatelessWidget {
  ProfileInformationWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 326.w,
      decoration: BoxDecoration(
        color: const Color(0xff0E87BD),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Container(
                  height: 31.h,
                  width: 31.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: const Color(0xff0E87BD),
                  ),
                ),
                16.pw(),
                AppText(
                    text: text,
                    fontSize: 15.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 35.sp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
