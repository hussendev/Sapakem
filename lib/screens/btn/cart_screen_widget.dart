import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/cart/cart_item_widget.dart';
import 'package:sapakem/widgets/cart/cart_widget.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(title: 'סַל'),
        23.ph(),
        Container(
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
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          width: 358.w,
          child: Column(
            children: const [
              CartWidget(),
              Divider(
                height: 10,
                color: Color(0xff909090),
              ),
              CartItemWidget()
            ],
          ),
        ),
      ],
    ));
  }
}
