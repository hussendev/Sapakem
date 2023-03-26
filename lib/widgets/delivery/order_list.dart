import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/delivery/item_order.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderList extends StatelessWidget {
  final List<Object> items;
  final bool withoutOrderDetails;

  const OrderList({Key? key, required this.items, this.withoutOrderDetails = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 35.w, vertical: 41.h),
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Column(
            children: [
              58.ph(),
              Row(
                children: [
                  AppText(
                    text: AppLocalizations.of(context)!.the_total,
                    fontSize: 22.sp,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                  const Spacer(),
                  AppText(
                    text: '₪ 30.0',
                    fontSize: 21.sp,
                    color: Color(0xff1C8ABB),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              for (var i = 0; i < items.length; i++)
                Column(
                  children: [
                    const ItemOrder(),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                  ],
                ),
              if (!withoutOrderDetails)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: AppLocalizations.of(context)!.order_details,
                      fontSize: 16.sp,
                      color: const Color(0xff1C8ABB),
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Color(0xff1C8ABB),
                          size: 20.w,
                        ),
                        9.pw(),
                        AppText(
                          text: '2 مارس 2023  | 08:40 ص',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/delivery/order.svg', color: Color(0xff1C8ABB), width: 20.w),
                        AppText(
                          text: 'أحضر وجبتك الخاصة',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    21.ph(),
                  ],
                ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: SvgPicture.asset('assets/logo_app_bar.svg'),
        ),
      ],
    );
  }
}
