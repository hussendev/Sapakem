import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/sized_box_extension.dart';

import '../../../widgets/merchant/information_merchant_widget.dart';
import '../../../widgets/merchant/products_for_merchant_widget.dart';

class MerchantScreen extends StatelessWidget {
  const MerchantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 248,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 25.h),
                        height: 44.h,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child:
                                  const Icon(Icons.arrow_circle_right_outlined),
                            ),
                            const Spacer(),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 44.h,
                              width: 44.w,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Icon(Icons.shopping_cart),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 220.h, left: 37.w, right: 37.w),
                  height: 111.h,
                  width: 112.w,
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                )
              ],
            ),
            9.ph(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: Column(
                children: [
                  const InformationMerchantWidget(),
                  31.ph(),
                  const ProductsForMerchantWidget(),
                  20.ph(),
                  const ProductsForMerchantWidget(),
                  20.ph(),
                  const ProductsForMerchantWidget(),
                  20.ph(),
                ],
              ),
            )
          ],
        ));
  }
}
