import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/cubit/home/product/producr_cubit.dart';
import 'package:sapakem/widgets/app_text.dart';

class incrementAndDecrementWidget extends StatelessWidget {
  incrementAndDecrementWidget({
    super.key,
    required this.counter
  });
  int counter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(8.r)),
            child: InkWell(
              onTap: () {
                ProductCubit.get(context).increment();
              },
              child: Center(
                child: AppText(
                  text: "+",
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Center(
            child: AppText(
              text: ProductCubit.get(context).quantity.toString(),
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(8.r)),
            child: InkWell(
              onTap: () {
                ProductCubit.get(context).decrement();
              },
              child: Center(
                child: AppText(
                  text: "-",
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}