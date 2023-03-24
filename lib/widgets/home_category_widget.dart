import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/context_extenssion.dart';

class HomeSubCategoryWidget extends StatelessWidget {
  const HomeSubCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/merchants_by_category');
            },
            child: Container(
              margin: EdgeInsets.only(
                left: context.localizations.language == 'en' ? 0.w : 10.w,
                right: context.localizations.language == 'en' ? 10.w : 0.w,
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              width: 65.w,
              height: 65.h,
            ),
          );
        },
      ),
    );
  }
}
