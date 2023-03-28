import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/sized_box_extension.dart';

import '../../../widgets/app_text.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      height: 130.h,
      width: 364.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        height: 104.h,
        width: 323.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                    text: 'التاريخ والوقت',
                    fontSize: 12.sp,
                    color: Colors.black),
              ],
            ),
            9.ph(),
            Expanded(
              child: SizedBox(
                // height: double.infinity,
                width: 282.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        text: 'عنوان الاشعار',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    AppText(
                        text: 'النص الداخلي للاشعار',
                        fontSize: 14.sp,
                        color: Colors.black),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
