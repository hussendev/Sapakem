import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/context_extenssion.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51.25.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              // color: Colors.white,
              borderRadius: BorderRadius.circular(23.r),
            ),
            margin: EdgeInsets.only(
              left: context.localizations.language == 'en' ? 0.w : 10.w,
              right: context.localizations.language == 'en' ? 10.w : 0.w,
            ),
            width: 112.33.w,
            height: 51.25.h,
          );
        },
      ),
    );
  }
}
