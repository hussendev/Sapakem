import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/cubit/home/home_states.dart';
import 'package:sapakem/cubit/home/product/producr_cubit.dart';
import 'package:sapakem/model/home/product_cart.dart';
import 'package:sapakem/widgets/app_text.dart';

import '../../cubit/home/home_cubit.dart';

class CartWidget extends StatelessWidget {
  CartWidget({
    super.key,
    required this.id,
  });
  int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getMerchant(id),
      child: BlocBuilder<HomeCubit,HomeStates>(
        builder: (context, state) {
          if(state is SuccessMerchantState){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 11.w),
              width: 358.w,
              height: 88.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   CircleAvatar(
                     backgroundImage: NetworkImage(state.merchant.merchantLogo!),
                   ),
                  AppText(text: state.merchant.storeName!, fontSize: 13.sp, color: Colors.black),
                  InkWell(
                    onTap: () {
                     context.read<ProductCubit>().removeMerchantFromCart(id);
                    },
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff1C8ABB),
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }else{
            return Container();
          }

        },
        buildWhen: (previous, current) {
          if (current is SuccessMerchantState) {
            return true;
          }
          return false;
        }
      ),
    );
  }
}
