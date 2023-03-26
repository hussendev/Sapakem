import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_bar_container_widget.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderScreenWidget extends StatefulWidget {
  const OrderScreenWidget({super.key});

  @override
  State<OrderScreenWidget> createState() => _OrderScreenWidgetState();
}

class _OrderScreenWidgetState extends State<OrderScreenWidget> {
  int indexPageSelected = 0;

  Decoration decorationSelectedButton = BoxDecoration(
    color: const Color(0xff1C8ABB),
    borderRadius: BorderRadius.circular(28.r),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        blurRadius: 8,
        offset: const Offset(5, 5),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: AppLocalizations.of(context)!.my_requests),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  31.ph(),
                  Container(
                    height: 56.h,
                    margin: EdgeInsets.symmetric(
                      horizontal: 34.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 8,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  indexPageSelected = 0;
                                },
                              );
                            },
                            child: Container(
                              height: 56.h,
                              decoration: indexPageSelected == 0 ? decorationSelectedButton : null,
                              child: Center(
                                child: AppText(
                                  text: AppLocalizations.of(context)!.my_current_requests,
                                  fontSize: 14.sp,
                                  color: indexPageSelected == 0 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  indexPageSelected = 1;
                                },
                              );
                            },
                            child: Container(
                              height: 56.h,
                              decoration: indexPageSelected == 1 ? decorationSelectedButton : null,
                              child: Center(
                                child: AppText(
                                  text: AppLocalizations.of(context)!.my_previous_requests,
                                  fontSize: 14.sp,
                                  color: indexPageSelected == 1 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  25.ph(),
                ],
              ),
            ),
            38.ph(),
            Stack(
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
                      Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          9.pw(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: 'اسم المنتج',
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: '₪ 30.0',
                                fontSize: 16.sp,
                                color: const Color(0xff1C8ABB),
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                text: AppLocalizations.of(context)!.quantity,
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: ' : ',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: '2',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          9.pw(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: 'اسم المنتج',
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: '₪ 30.0',
                                fontSize: 16.sp,
                                color: const Color(0xff1C8ABB),
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                text: AppLocalizations.of(context)!.quantity,
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: ' : ',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: '2',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          9.pw(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: 'اسم المنتج',
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: '₪ 30.0',
                                fontSize: 16.sp,
                                color: const Color(0xff1C8ABB),
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                text: AppLocalizations.of(context)!.quantity,
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: ' : ',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: '2',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
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
                              SvgPicture.asset('assets/order.svg',
                                  color: Color(0xff1C8ABB), width: 20.w),
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
            ),






            20.ph(),

            Stack(
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
                      Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          9.pw(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: 'اسم المنتج',
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: '₪ 30.0',
                                fontSize: 16.sp,
                                color: const Color(0xff1C8ABB),
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                text: AppLocalizations.of(context)!.quantity,
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: ' : ',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: '2',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          9.pw(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: 'اسم المنتج',
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: '₪ 30.0',
                                fontSize: 16.sp,
                                color: const Color(0xff1C8ABB),
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                text: AppLocalizations.of(context)!.quantity,
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: ' : ',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: '2',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          9.pw(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: 'اسم المنتج',
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'المكونات',
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: '₪ 30.0',
                                fontSize: 16.sp,
                                color: const Color(0xff1C8ABB),
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                text: AppLocalizations.of(context)!.quantity,
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: ' : ',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: '2',
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
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
                              SvgPicture.asset('assets/order.svg',
                                  color: Color(0xff1C8ABB), width: 20.w),
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
            ),


            50.ph(),
          ],
        ),
      ),
    );
  }
}
