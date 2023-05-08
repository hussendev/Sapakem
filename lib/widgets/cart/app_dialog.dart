import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/cubit/auth/city/city_cubit.dart';
import 'package:sapakem/cubit/auth/city/city_states.dart';
import 'package:sapakem/cubit/city_price/cites_price_cubit.dart';
import 'package:sapakem/cubit/orders/orders_cubit.dart';
import 'package:sapakem/model/city.dart';
import 'package:sapakem/screens/btn/order_screens/order_screen_widget.dart';
import 'package:sapakem/util/app_colors_extenssion.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/delivery/item_order.dart';

class AppDialog {
  // static void productOrder(BuildContext context, String imageUrl, Function(int numberOfItems) onChanged) {
  //   int numberOfItems = 1;
  //   showDialog(
  //     context: context,
  //     builder: (context) => Dialog(
  //       backgroundColor: Colors.transparent,
  //       elevation: 0,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Container(
  //             width: 358,
  //             height: 200,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: SvgPicture.asset(imageUrl),
  //           ),
  //           10.ph(),
  //           Container(
  //             padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: 10.w),
  //                   width: 358.w,
  //                   height: 70.h,
  //                   decoration: BoxDecoration(
  //                     color: app_primary,
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                   child: Row(
  //                     children: [
  //                       AppText(text: 'product Name', fontSize: 23.sp, color: Colors.white),
  //                       3.pw(),
  //                       const Spacer(),
  //                       Container(
  //                         height: 40.h,
  //                         padding: EdgeInsets.symmetric(horizontal: 5.w),
  //                         decoration: const BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.all(
  //                             Radius.circular(10),
  //                           ),
  //                         ),
  //                         child: Center(
  //                             child: Row(
  //                           children: [
  //                             SizedBox(
  //                               width: 30.w,
  //                               child: IconButton(
  //                                 padding: EdgeInsets.zero,
  //                                 icon: const Icon(Icons.remove),
  //                                 onPressed: () {
  //                                   if (numberOfItems > 1) {
  //                                     onChanged(--numberOfItems);
  //                                   }
  //                                 },
  //                               ),
  //                             ),
  //                             const VerticalDivider(
  //                               color: Colors.black,
  //                               thickness: 1,
  //                             ),
  //                             AppText(text: '$numberOfItems كيلو', fontSize: 14.sp, color: Colors.black),
  //                             const VerticalDivider(
  //                               color: Colors.black,
  //                               thickness: 1,
  //                             ),
  //                             SizedBox(
  //                               width: 30.w,
  //                               child: Center(
  //                                 child: IconButton(
  //                                   padding: EdgeInsets.zero,
  //                                   icon: const Icon(Icons.add),
  //                                   onPressed: () {
  //                                     onChanged(++numberOfItems);
  //                                   },
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         )),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 10.ph(),
  //                 GestureDetector(
  //                   onTap: () {
  //                     Navigator.pop(context);
  //                     _orderNow(context);
  //                   },
  //                   child: Container(
  //                     //add to cart button
  //                     width: 358.w,
  //                     height: 40.h,
  //                     decoration: BoxDecoration(
  //                       color: app_primary,
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: Center(
  //                       child: AppText(
  //                         text: context.localizations.add_to_cart,
  //                         fontSize: 20.sp,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  static void productOrder(BuildContext context, Map<String, dynamic> data, double subTotal) {
    Logger().i(data);
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CitesPriceCubit>(create: (context) => CitesPriceCubit()..getCitesPrices(data.keys.toList(), 1)),
            BlocProvider<OrdersCubit>(
              create: (context) => OrdersCubit()..getPayWay(PayMethod.none),
            ),
          ],
          child: BlocBuilder<CityCubit, CityStates>(
            builder: (context, state) {
              if (state is CitySuccessState) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: BlocBuilder<OrdersCubit, OrdersState>(
                    builder: (context, orderState) {
                      if (orderState is PayWayState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            10.ph(),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<OrdersCubit>().getPayWay(PayMethod.delivery);
                                    },
                                    child: Container(
                                      // width: 150.w,
                                      height: 150.h,
                                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color: orderState.payMethod == PayMethod.delivery ? app_primary : Colors.white,
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
                                            text: 'Delivery',
                                            fontSize: 14.sp,
                                            color: orderState.payMethod == PayMethod.delivery ? Colors.white : Colors.black38,
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<OrdersCubit>().getPayWay(PayMethod.cash);
                                    },
                                    child: Container(
                                      // width: 150.w,
                                      height: 150.h,
                                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color: orderState.payMethod == PayMethod.cash ? app_primary : Colors.white,
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
                                            color: orderState.payMethod == PayMethod.cash ? Colors.white : Colors.black38,
                                          ),
                                          AppText(
                                            text: context.localizations.cash,
                                            fontSize: 13.sp,
                                            color: orderState.payMethod == PayMethod.cash ? Colors.white : Colors.black54,
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (orderState.payMethod == PayMethod.delivery)
                              const Divider(
                                color: Colors.black38,
                                thickness: 1,
                              ),
                            if (orderState.payMethod == PayMethod.delivery)
                              Row(
                                children: [
                                  Expanded(child: AppText(text: 'Your City:', fontSize: 16.sp, color: Colors.black45)),
                                  Expanded(
                                    child: DropdownButtonFormField<City>(
                                        decoration: const InputDecoration(
                                          hintText: 'Please Select City',
                                          enabledBorder: InputBorder.none,
                                          border: InputBorder.none,
                                        ),
                                        value: state.cities.first,
                                        items: state.cities
                                            .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: AppText(text: e.name == null ? '' : e.name!, fontSize: 16.sp, color: Colors.black45),
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          context.read<CityCubit>().ChangeCity(value!);
                                          context.read<CitesPriceCubit>().changeCity(value.id!, data.keys.toList());
                                        }),
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
                                  text: context.localizations.order_cost,
                                  fontSize: 16.sp,
                                  color: Colors.black54,
                                ),
                                AppText(
                                  text: '₪ $subTotal',
                                  fontSize: 20.sp,
                                  color: app_primary,
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.black38,
                              thickness: 1,
                            ),
                            BlocBuilder<CitesPriceCubit, CitesPriceState>(builder: (context, state2) {
                              if (state2 is CitesPriceSuccessState) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          text: 'Delivery',
                                          fontSize: 16.sp,
                                          color: Colors.black54,
                                        ),
                                        if (orderState.payMethod == PayMethod.delivery)
                                          AppText(
                                            text: '₪ ${state2.price}',
                                            fontSize: 20.sp,
                                            color: app_primary,
                                          ),
                                        if (orderState.payMethod != PayMethod.delivery)
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
                                          text: 'Total',
                                          fontSize: 16.sp,
                                          color: Colors.black54,
                                        ),
                                        if (orderState.payMethod == PayMethod.delivery)
                                          AppText(
                                            text: '₪ ${subTotal + state2.price}',
                                            fontSize: 20.sp,
                                            color: app_primary,
                                          ),
                                        if (orderState.payMethod != PayMethod.delivery)
                                          AppText(
                                            text: '₪ ${subTotal}',
                                            fontSize: 20.sp,
                                            color: app_primary,
                                          ),
                                      ],
                                    ),
                                  ],
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            }),
                            50.ph(),
                            GestureDetector(
                              onTap: () {
                                if (orderState.payMethod != PayMethod.none) {
                                  _choseDate(context, (p0) {
                                    Future.delayed(const Duration(milliseconds: 0), () {
                                      Navigator.of(context).pop();
                                      context.read<OrdersCubit>().createOrder(data, '${state.cities.first.id!}', orderState.payMethod.name, context);
                                      // _finalDialog(context);
                                    });
                                  });
                                }
                              },
                              child: Container(
                                height: 40.h,
                                margin: EdgeInsets.symmetric(horizontal: 50.w),
                                decoration: BoxDecoration(
                                  color: orderState.payMethod == PayMethod.none ? Colors.grey : app_primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: AppText(
                                    text: 'Order Now',
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                );
              } else if (state is CityErrorState) {
                return AppText(
                  text: state.error,
                  fontSize: 16.sp,
                  color: Colors.black54,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
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
                      ItemOrder(),
                      const Divider(
                        color: Colors.black38,
                        thickness: 1,
                      ),
                      ItemOrder(),
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
                      ItemOrder(),
                      const Divider(
                        color: Colors.black38,
                        thickness: 1,
                      ),
                      ItemOrder(),
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
