import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/model/home/titles.dart';
import 'package:sapakem/screens/app/home/show_more.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

import 'merchant/merchant_widget.dart';

class HomeMerchantCategory extends StatelessWidget {
  HomeMerchantCategory({
    super.key,
    required this.titles,
  });

  Titles titles;

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
                AppText(text: titles.title!, fontSize: 21.sp, color: Colors.blue),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowMore(merchants: titles.merchants!),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 20.04.h,
                    child: Row(
                      children: [
                        AppText(text: context.localizations.show_more, fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.black),
                        5.pw(),
                        const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 10),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          20.ph(),
          Expanded(
            child: GridView.builder(
              itemCount: titles.merchants!.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return MerchantWidget(
                  merchant: titles.merchants![index],
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
          )
        ],
      ),
    );
  }
}
