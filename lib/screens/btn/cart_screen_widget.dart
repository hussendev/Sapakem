import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sapakem/cubit/home/product/product_state.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/cart/app_dialog.dart';
import 'package:sapakem/widgets/cart/cart_item_widget.dart';
import 'package:sapakem/widgets/cart/cart_widget.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';

import '../../cubit/home/product/product_cubit.dart';
import '../../widgets/app_text.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = getCartForUser(context.read<ProductCubit>().cart,
        SharedPrefController().getValueFor(PrefKeys.id.name));
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(title: context.localizations.cart),
        20.ph(),
        BlocBuilder<ProductCubit, ProductStates>(
          builder: (context, state) {
            return data.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.w),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          height: 400.h,
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                String merchantID = data.keys.elementAt(index);
                                List<Map<String, dynamic>> value =
                                    data[merchantID];
                                return Container(
                                  margin: const EdgeInsets.all(8),
                                  height: 263.h,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                        offset: const Offset(3, 3),
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Column(
                                    children: [
                                      CartWidget(id: int.parse(merchantID)),
                                      const Divider(
                                        height: 10,
                                        color: Color(0xff909090),
                                      ),
                                      CartItemWidget(
                                          length: value.length, data: value),
                                    ],
                                  ),
                                );
                              },
                              padding: EdgeInsets.zero,
                              itemCount: data.length),
                        ),
                        23.ph(),
                        SizedBox(
                          height: 113.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                  fontWeight: FontWeight.bold,
                                  text: context.localizations.payment_summary,
                                  fontSize: 15.sp,
                                  color: Colors.black),
                              10.ph(),
                              Row(
                                children: [
                                  AppText(
                                      text: context.localizations.subtotal,
                                      fontSize: 13.sp,
                                      color: const Color(0xff3F4446),
                                      fontWeight: FontWeight.bold),
                                  const Spacer(),
                                  AppText(
                                      text: '₪ 0',
                                      fontSize: 13.sp,
                                      color: const Color(0xff3F4446),
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                              10.ph(),
                              Row(
                                children: [
                                  AppText(
                                      text: context.localizations.total,
                                      fontSize: 13.sp,
                                      color: const Color(0xff3F4446),
                                      fontWeight: FontWeight.bold),
                                  const Spacer(),
                                  AppText(
                                      text: getSubTotal(data).toString(),
                                      fontSize: 13.sp,
                                      color: const Color(0xff3F4446),
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                            ],
                          ),
                        ),
                        65.ph(),
                        const Divider(
                          height: 10,
                          color: Color(0xff909090),
                        ),
                        Row(
                          children: [
                            AppText(
                                text: context.localizations.the_total_amount,
                                fontSize: 13.sp,
                                color: const Color(0xff3F4446),
                                fontWeight: FontWeight.bold),
                            const Spacer(),
                            AppText(
                                text: getSubTotal(data).toString(),
                                fontSize: 13.sp,
                                color: const Color(0xff3F4446),
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                        29.ph(),
                        SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              AppDialog.productOrder(
                                  context, data, getSubTotal(data));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff1C8ABB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: AppText(
                                text: context.localizations.proceed_to_payment,
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Lottie.asset('assets/lottie/empty.json'),
                        AppText(
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            text:
                                'You don\'t have any items. Please go for shopping',
                            fontSize: 20.sp,
                            color: Colors.black),
                      ],
                    ),
                  );
          },
          buildWhen: (previous, current) {
            if (current is ProcessProductState ||
                current is ErrorAddProductState) {
              return true;
            }
            return false;
          },
        ),
      ],
    ));
  }

  getSubTotal(Map<String, dynamic> data) {
    double total = 0;
    data.forEach((key, value) {
      value.forEach((element) {
        total += element['price_offer'] * element['quantity'];
      });
    });
    return total;
  }

  getCartForUser(Map<String, dynamic> data, String userId) {
    if (data[userId] == null) {
      return {};
    }
    return data[userId];
  }
}
