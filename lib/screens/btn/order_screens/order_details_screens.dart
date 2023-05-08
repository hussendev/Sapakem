import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/cubit/orders/orders_cubit.dart';
import 'package:sapakem/model/order.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';
import 'package:sapakem/widgets/delivery/order_list.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  const OrderDetailsScreen(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersCubit>(
      create: (context) => OrdersCubit()..getOrderDetails('${order.id!}'),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            context
                .read<OrdersCubit>()
                .getOrderDetails('${order.id!}', isRefresh: true);
          },
          child: Column(
            children: [
              CustomAppBar(title: context.localizations.my_requests),
              Center(
                child: BlocBuilder<OrdersCubit, OrdersState>(
                  builder: (context, state) {
                    if (state is OrderDetailsSuccessful) {
                      return OrderList(
                        order: order,
                        ordersDetails: state.orders,
                      );
                    } else if (state is OrdersLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is OrdersError) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<OrdersCubit>()
                              .getOrderDetails('${order.id!}', isRefresh: true);
                        },
                        child: AppText(
                            text: state.message,
                            fontSize: 14.sp,
                            color: Colors.black54),
                      );
                    }
                    return AppText(
                        text: 'I don\'t know why this happen!!',
                        fontSize: 14.sp,
                        color: Colors.black54);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
