import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';

import '../app_button_widget.dart';
import '../app_text.dart';

class InformationMerchantWidget extends StatelessWidget {
  const InformationMerchantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          // height: 128.h,
          width: 240.w,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                const Text(
                  'اسم التاجر',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                33.pw(),
                Container(
                  height: 20.16.h,
                  width: 81.5.w,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 10.h,
                        width: 10.w,
                        decoration: const BoxDecoration(
                            color: Color(0xff69DF57), shape: BoxShape.circle),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        height: 25.h,
                        width: 25.w,
                        child: const Icon(
                          Icons.share,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 15,
                      )
                    ],
                  ),
                )
              ],
            ),
            AppText(
              text: "العنوان",
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 21.91.h,
              // width: 237.w,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 20,
                      ),
                      4.4.pw(),
                      AppText(
                        text: context.localizations.click_for_more_information,
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  22.pw(),
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.blue,
                    size: 20,
                  ),
                  AppText(
                    text: "12:00 - 8:00",
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            AppText(
              text: "خلال 30 دقيقة (الحد الأقصى لتجهيز الطلب)",
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            8.ph(),
            AppButton(
              height: 30.h,
              width: 107.w,
              onPressed: () {},
              text: context.localizations.send_a_request,
            )
          ]),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 111.h,
              width: 70.w,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: AppText(
                  textAlign: TextAlign.center,
                  text: context
                      .localizations.estimated_time_of_arrival_of_your_order,
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 70.h,
              width: 70.w,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Center(
                child: AppText(
                    textAlign: TextAlign.center,
                    text: ' ₪ 30.0',
                    fontSize: 18.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
