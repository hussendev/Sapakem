import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

class CurrentRequestsWidget extends StatelessWidget {
  final int orderStatus;

  const CurrentRequestsWidget({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
      margin: EdgeInsets.symmetric(horizontal: 36.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: SizedBox(
              height: 211,
              child: Column(
                children: [
                  Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: orderStatus >= 0 ? const Color(0xff1C8ABB) : const Color(0xffE2E4E4),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: orderStatus >= 0 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: VerticalDivider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: orderStatus >= 1 ? const Color(0xff1C8ABB) : const Color(0xffE2E4E4),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: orderStatus >= 1 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: VerticalDivider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: orderStatus >= 2 ? const Color(0xff1C8ABB) : const Color(0xffE2E4E4),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: orderStatus >= 2 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: 259.w,
                height: 74.h,
                decoration: BoxDecoration(
                  color: orderStatus >= 0 ? Color(0xff1C8ABB) : Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: AppText(
                      text: AppLocalizations.of(context)!.your_request_has_been_sent,
                      color: orderStatus >= 0 ? Colors.white : Colors.black,
                      fontSize: 14.sp,
                    ),
                    trailing: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              11.ph(),
              Container(
                width: 259.w,
                height: 74.h,
                decoration: BoxDecoration(
                  color: orderStatus >= 1 ? Color(0xff1C8ABB) : Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: AppText(
                      text: AppLocalizations.of(context)!.the_restaurant_has_started_processing_the_order,
                      color: orderStatus >= 1 ? Colors.white : Colors.black,
                      fontSize: 14.sp,
                    ),
                    trailing: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              11.ph(),
              Container(
                width: 259.w,
                height: 74.h,
                decoration: BoxDecoration(
                  color: orderStatus >= 2 ? Color(0xff1C8ABB) : Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: AppText(
                      text: AppLocalizations.of(context)!.the_order_is_completed,
                      color: orderStatus >= 2 ? Colors.white : Colors.black,
                      fontSize: 14.sp,
                    ),
                    trailing: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
