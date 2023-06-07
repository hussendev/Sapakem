import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
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
    return titles.merchants!.isNotEmpty
        ? Container(
            height: 330.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 33.h,
                  child: Row(
                    children: [
                      AppText(
                          text: titles.title!,
                          fontSize: 21.sp,
                          color: Colors.blue),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ShowMore(merchants: titles.merchants!),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 20.04.h,
                          child: Row(
                            children: [
                              AppText(
                                  text: context.localizations.show_more,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: Colors.black),
                              5.pw(),
                              const Icon(Icons.arrow_forward_ios,
                                  color: Colors.black, size: 10),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                20.ph(),
                Container(
                  child: Container(
                    height: 240.h,
                    child: ListView.builder(
                      cacheExtent: 1000,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: titles.merchants!.length,
                      itemBuilder: (context, index) {
                        return MerchantWidget(
                          merchant: titles.merchants![index],
                        );
                      },
                      shrinkWrap: true,
                    ),
                  ),
                )
              ],
            ),
          )
        : Center(
            child: AppText(
                text: 'No Titles ', color: Colors.black, fontSize: 20.sp));
  }
}
