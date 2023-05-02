import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/screens/btn/order_screens/order_screen_widget.dart';
import 'package:sapakem/util/app_colors_extenssion.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/delivery/item_order.dart';

class AppDialog {
  static void productOrder(BuildContext context, String imageUrl, Function(int numberOfItems) onChanged) {
    int numberOfItems = 1;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 358,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(imageUrl),
            ),
            10.ph(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    width: 358.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: app_primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        AppText(text: 'product Name', fontSize: 23.sp, color: Colors.white),
                        3.pw(),
                        const Spacer(),
                        Container(
                          height: 40.h,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 30.w,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    if (numberOfItems > 1) {
                                      onChanged(--numberOfItems);
                                    }
                                  },
                                ),
                              ),
                              const VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              AppText(text: '$numberOfItems كيلو', fontSize: 14.sp, color: Colors.black),
                              const VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              SizedBox(
                                width: 30.w,
                                child: Center(
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      onChanged(++numberOfItems);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
                  10.ph(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _orderNow(context);
                    },
                    child: Container(
                      //add to cart button
                      width: 358.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: app_primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: AppText(
                          text: context.localizations.add_to_cart,
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static void _orderNow(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  10.ph(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          // width: 150.w,
                          height: 150.h,
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'assets/delivery/arrive_order.svg',
                                width: 45.w,
                                height: 45.h,
                              ),
                              AppText(
                                text: context.localizations.bring_the_meal_with_the_sender,
                                fontSize: 13.sp,
                                color: Colors.black38,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // width: 150.w,
                          height: 150.h,
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'assets/delivery/order.svg',
                                width: 45.w,
                                height: 45.h,
                                color: Colors.black38,
                              ),
                              AppText(
                                text: context.localizations.bring_your_own_meal,
                                fontSize: 13.sp,
                                color: Colors.black38,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.ph(),
                  const Divider(
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: context.localizations.order_cost,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                      AppText(
                        text: '₪ 30.0',
                        fontSize: 20.sp,
                        color: app_primary,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: context.localizations.postage,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                      AppText(
                        text: '-',
                        fontSize: 20.sp,
                        color: app_primary,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: context.localizations.final_amount_to_be_paid,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                      AppText(
                        text: '₪ 30.0',
                        fontSize: 20.sp,
                        color: app_primary,
                      ),
                    ],
                  ),
                  50.ph(),
                ],
              ),
            ),
            Positioned(
              bottom: 3.h,
              left: 0.w,
              right: 0.w,
              child: GestureDetector(
                onTap: () {
                  _choseDate(context, (p0) {
                    Future.delayed(const Duration(milliseconds: 0), () {
                      Navigator.of(context).pop();
                      _finalDialog(context);
                    });
                  });
                },
                child: Container(
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 50.w),
                  decoration: BoxDecoration(
                    color: app_primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: AppText(
                      text: context.localizations.click_to_complete_payment,
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _choseDate(BuildContext context, Function(DateTime) onChanged) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    ).then(
      (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }

  static void _finalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                18.ph(),
                AppText(text: context.localizations.the_order_will_be_sent_within_15_seconds, fontSize: 18.sp, color: Colors.black),
                18.ph(),
                Container(
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 50.w),
                  decoration: BoxDecoration(
                    color: app_primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(10)),
                          ),
                          child: Center(
                            child: AppText(
                              text: '00:10',
                              fontSize: 20.sp,
                              color: app_primary,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: app_primary,
                              borderRadius: const BorderRadiusDirectional.horizontal(
                                end: Radius.circular(10),
                              ),
                              border: Border.all(color: app_primary),
                            ),
                            child: Center(
                              child: AppText(
                                text: context.localizations.change_the_request,
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                18.ph(),
                Container(
                  // height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      10.ph(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/logo_app_bar.svg',
                            height: 60.h,
                            width: 60.w,
                          ),
                          10.pw(),
                          AppText(
                            text: 'اسم التاجر',
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black38,
                        thickness: 1,
                      ),
                      const ItemOrder(),
                      const Divider(
                        color: Colors.black38,
                        thickness: 1,
                      ),
                      const ItemOrder(),
                      10.ph(),
                    ],
                  ),
                ),
                18.ph(),
                Container(
                  // height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      10.ph(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/logo_app_bar.svg',
                            height: 60.h,
                            width: 60.w,
                          ),
                          10.pw(),
                          AppText(
                            text: 'اسم التاجر',
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black38,
                        thickness: 1,
                      ),
                      const ItemOrder(),
                      const Divider(
                        color: Colors.black38,
                        thickness: 1,
                      ),
                      const ItemOrder(),
                      10.ph(),
                    ],
                  ),
                ),
                18.ph(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: context.localizations.final_amount_to_be_paid,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                      AppText(
                        text: '₪ 30.0',
                        fontSize: 20.sp,
                        color: app_primary,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                10.pw(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: AppText(
                    text: context.localizations.once_the_order_has_been_sent_it_is_not_possible_to_reverse_or_change_the_order,
                    fontSize: 20.sp,
                    color: Colors.red,
                    textAlign: TextAlign.center,
                  ),
                ),
                30.ph(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrderScreenWidget()));
                  },
                  child: Container(
                    height: 40.h,
                    margin: EdgeInsets.symmetric(horizontal: 50.w),
                    decoration: BoxDecoration(
                      color: app_primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: AppText(
                        text: context.localizations.complete_the_process,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                30.ph(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
