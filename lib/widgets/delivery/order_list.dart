import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapakem/model/order.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

class OrderList extends StatelessWidget {
  final Order order;
  final bool withoutOrderDetails;

  const OrderList({Key? key, required this.order, this.withoutOrderDetails = false}) : super(key: key);

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
                    text: order.subTotal.toString(),
                    fontSize: 21.sp,
                    color: const Color(0xff1C8ABB),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              // Column(
              //   children: [
              //     // const ItemOrder(),
              //     Divider(
              //       color: Colors.grey.shade300,
              //       thickness: 1,
              //     ),
              //   ],
              // ),
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
                          color: const Color(0xff1C8ABB),
                          size: 20.w,
                        ),
                        9.pw(),
                        AppText(
                          text: 'The Create Date',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        AppText(
                          text: order.date!,
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: const Color(0xff1C8ABB),
                          size: 20.w,
                        ),
                        9.pw(),
                        AppText(
                          text: 'The Received Date',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        AppText(
                          text: order.dateReceived!,
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.lock_clock,
                          color: const Color(0xff1C8ABB),
                          size: 20.w,
                        ),
                        9.pw(),
                        AppText(
                          text: 'The Received Hour',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        AppText(
                          text: order.hour!,
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.payments,
                          color: const Color(0xff1C8ABB),
                          size: 20.w,
                        ),
                        9.pw(),
                        AppText(
                          text: 'Payment Type',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        AppText(
                          text: order.paymentType!,
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: const Color(0xff1C8ABB),
                          size: 20.w,
                        ),
                        9.pw(),
                        AppText(
                          text: 'Address',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        AppText(
                          text: order.address! == '' ? 'No Address' : order.address!,
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     SvgPicture.asset('assets/delivery/order.svg', color: const Color(0xff1C8ABB), width: 20.w),
                    //     AppText(
                    //       text: 'أحضر وجبتك الخاصة',
                    //       fontSize: 12.sp,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ],
                    // ),
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
