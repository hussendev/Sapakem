import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11.w),
      height: 59.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    height: 59.h,
                    width: 84.w,
                  ),
                  Container(
                    width: 12.w,
                    height: 12.h,
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              5.pw(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: 'اسم المنتج', fontSize: 13.sp, color: Colors.black),
                  AppText(
                      text: '30.0',
                      fontSize: 13.sp,
                      color: const Color(0xff1C8ABB)),
                ],
              ),
            ],
          ),
          AppText(text: 'כמות : 2', fontSize: 12.sp, color: Colors.black)
        ],
      ),
    );
  }
}
