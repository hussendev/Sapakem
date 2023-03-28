import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';

import 'merchant/merchant_screen.dart';

class MerchantsByCategory extends StatelessWidget {
  const MerchantsByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "افضل المطاعم"),
          29.ph(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: GridView.builder(
                itemCount: 10,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MerchantScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 214.w,
                      height: 170.h,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 170 / 214,
                  crossAxisSpacing: 17.w,
                  mainAxisSpacing: 20.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
