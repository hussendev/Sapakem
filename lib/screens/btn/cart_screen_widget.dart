import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/cart/cart_item_widget.dart';
import 'package:sapakem/widgets/cart/cart_widget.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';

import '../../widgets/app_text.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(title: 'סַל'),
        20.ph(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Column(
            children: [
              Container(
                height: 263.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: const Offset(3, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: const [
                    CartWidget(),
                    Divider(
                      height: 10,
                      color: Color(0xff909090),
                    ),
                    CartItemWidget(),
                  ],
                ),
              ),
              23.ph(),
              SizedBox(
                height: 113.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        fontWeight: FontWeight.bold,
                        text: 'סיכום תשלום',
                        fontSize: 15.sp,
                        color: Colors.black),
                    10.ph(),
                    Row(
                      children: [
                        AppText(
                            text: 'סך הכל',
                            fontSize: 13.sp,
                            color: const Color(0xff3F4446),
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        AppText(
                            text: '₪ 0',
                            fontSize: 13.sp,
                            color: const Color(0xff3F4446),
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    10.ph(),
                    Row(
                      children: [
                        AppText(
                            text: 'משלוח',
                            fontSize: 13.sp,
                            color: const Color(0xff3F4446),
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        AppText(
                            text: '₪ 0',
                            fontSize: 13.sp,
                            color: const Color(0xff3F4446),
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              ),
              65.ph(),
              const Divider(
                height: 10,
                color: Color(0xff909090),
              ),
              Row(
                children: [
                  AppText(
                      text: 'הסכום הכולל',
                      fontSize: 13.sp,
                      color: const Color(0xff3F4446),
                      fontWeight: FontWeight.bold),
                  const Spacer(),
                  AppText(
                      text: '₪ 0',
                      fontSize: 13.sp,
                      color: const Color(0xff3F4446),
                      fontWeight: FontWeight.bold),
                ],
              ),
              29.ph(),
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1C8ABB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: AppText(
                      text: 'להמשיך לתשלום',
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
