import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/widgets/merchant/product_widget.dart';

import '../app_text.dart';

class ProductsForMerchantWidget extends StatelessWidget {
  const ProductsForMerchantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224.h,
      width: 377.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: const BoxDecoration(border: Border(right: BorderSide(color: Color(0xff1C8ABB), width: 1), left: BorderSide(color: Color(0xff1C8ABB), width: 1), top: BorderSide(color: Color(0xff1C8ABB), width: 1), bottom: BorderSide(color: Color(0xff1C8ABB), width: 1)), borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 10.w, bottom: 15.h, left: 10.w),
            child: AppText(
              text: context.localizations.most_wanted,
              fontSize: 20.sp,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 141.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ProductWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
