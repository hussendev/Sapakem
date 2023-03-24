import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

class HomeMerchantCategory extends StatelessWidget {
  const HomeMerchantCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.black,
      height: 370.h,
      child: Column(
        children: [
          SizedBox(
            height: 33.h,
            child: Row(
              children: [
                AppText(
                    text: 'המבוקש ביותר', fontSize: 21.sp, color: Colors.blue),
                const Spacer(),
                SizedBox(
                  height: 20.04.h,
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
          20.ph(),
          SizedBox(
            // color: Colors.amber,
            height: 316.h,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 19,
                  childAspectRatio: 113 / 142),
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 113.w,
                  height: 141.h,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
