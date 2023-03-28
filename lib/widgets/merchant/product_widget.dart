import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_text.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      height: 141.h,
      width: 113.w,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                // color: Colors.amber,
                ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              width: double.infinity,
              // color: Colors.blue,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'اسم المنتج',
                        fontSize: 13.sp,
                        color: Colors.black,
                      ),
                      AppText(
                        text: 'نبذه عنه ',
                        fontSize: 13.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.h, right: 5.w),
                    height: 12.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Colors.white,
                    ),
                    child: AppText(
                      text: ' ₪ 2.0',
                      fontSize: 9.sp,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
