import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';

import '../../widgets/app_text.dart';
import '../../widgets/home_category_widget.dart';
import '../../widgets/home_merchant_category.dart';
import '../../widgets/home_sub_category_widget.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(isHome: true, title: 'الموقع'),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 26.4.w,
              end: 38.6.w,
            ),
            child: Column(
              children: [
                23.5.ph(),
                const HomeCategoryWidget(),
                54.2.ph(),
                Container(
                  height: 184.h,
                  // width: 358.w,
                  decoration: const BoxDecoration(
                    color: Color(0xff1C8ABB),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                34.ph(),
                SizedBox(
                  height: 33.h,
                  child: Row(
                    children: [
                      AppText(text: 'הארוחות העיקריות', fontSize: 21.sp, color: Colors.blue),
                      const Spacer(),
                      SizedBox(
                        height: 20.04.h,
                        // width: 68.w,
                        child: Row(
                          children: [
                            AppText(text: 'להראות יותר', fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.black),
                            5.pw(),
                            const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 10),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                9.ph(),
                const HomeSubCategoryWidget(),
                17.ph(),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffFF6C6C),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 110.h,
                ),
                36.ph(),
                const HomeMerchantCategory(),
                4.ph(),
                const HomeMerchantCategory(),
                4.ph(),
                const HomeMerchantCategory(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
