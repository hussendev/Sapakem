import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapakem/cubit/orders/orders_cubit.dart';
import 'package:sapakem/cubit/requests/my_requests_cubit.dart';
import 'package:sapakem/screens/btn/order_screens/current_requests_wigget.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';
import 'package:sapakem/widgets/delivery/order_list.dart';

class OrderScreenWidget extends StatelessWidget {
  OrderScreenWidget({super.key});

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
      body: BlocBuilder<MyRequestsCubit, MyRequestsState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<OrdersCubit>().getOrders(isRefresh: true);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                      title: AppLocalizations.of(context)!.my_requests),
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
                                    context
                                        .read<MyRequestsCubit>()
                                        .convertToPreviousState();
                                  },
                                  child: Container(
                                    height: 56.h,
                                    decoration: !state.isCurrentRequests
                                        ? decorationSelectedButton
                                        : null,
                                    child: Center(
                                      child: AppText(
                                        text: AppLocalizations.of(context)!
                                            .my_current_requests,
                                        fontSize: 14.sp,
                                        color: !state.isCurrentRequests
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<MyRequestsCubit>()
                                        .convertToCurrentState();
                                  },
                                  child: Container(
                                    height: 56.h,
                                    decoration: state.isCurrentRequests
                                        ? decorationSelectedButton
                                        : null,
                                    child: Center(
                                      child: AppText(
                                        text: AppLocalizations.of(context)!
                                            .my_previous_requests,
                                        fontSize: 14.sp,
                                        color: state.isCurrentRequests
                                            ? Colors.white
                                            : Colors.black,
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
                  BlocBuilder<OrdersCubit, OrdersState>(
                    builder: (context, state2) {
                      if (state2 is OrdersLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state2 is OrdersSuccessful) {
                        return Visibility(
                          visible: state.isCurrentRequests,

                          /// my current requests
                          replacement: Column(
                            children: [
                              for (int i = 0; i < state2.orders.length; i++)
                                if (int.parse(state2.orders[i].status!) <= 3)
                                  Column(
                                    children: [
                                      CurrentRequestsWidget(
                                          orderStatus: int.parse(
                                                  state2.orders[i].status!) -
                                              1),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 36.w),
                                        child: ListTile(
                                          leading: SvgPicture.asset(
                                            'assets/delivery/order.svg',
                                            height: 35.h,
                                            width: 35.w,
                                          ),
                                          title: AppText(
                                            text: AppLocalizations.of(context)!
                                                .service_type,
                                            fontSize: 23.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 36.w),
                                        child: ListTile(
                                          leading: SvgPicture.asset(
                                            'assets/date.svg',
                                            height: 35.h,
                                            width: 35.w,
                                          ),
                                          title: AppText(
                                            text: AppLocalizations.of(context)!
                                                .order_details,
                                            fontSize: 23.sp,
                                            color: Colors.black,
                                          ),
                                          subtitle: AppText(
                                            text:
                                                '${state2.orders[i].hour!}  ${state2.orders[i].createdAt!}',
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      OrderList(order: state2.orders[i]),
                                      const Divider(
                                          thickness: 1, color: Colors.black45),
                                      50.ph(),
                                    ],
                                  ),
                            ],
                          ),

                          /// my previous requests
                          child: Column(
                            children: [
                              for (int i = 0; i < state2.orders.length; i++)
                                if (state2.orders[i].status! == '4' ||
                                    state2.orders[i].status! == '5')
                                  OrderList(order: state2.orders[i]),
                              if (state2.orders.isEmpty)
                                Center(
                                  child: AppText(
                                      text: 'No Previous Requests To Show',
                                      fontSize: 14.sp,
                                      color: Colors.black54),
                                ),
                              50.ph(),
                            ],
                          ),
                        );
                      } else if (state2 is OrdersError) {
                        return Text(state2.message);
                      }
                      return Text('Some Thing is wrong');
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
