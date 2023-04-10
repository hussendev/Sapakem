import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/cubit/home/home_cubit.dart';
import 'package:sapakem/cubit/home/home_states.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';

import '../../../widgets/merchant/merchant_widget.dart';
import '../merchant/merchant_screen.dart';

class MerchantsByCategory extends StatelessWidget {
   MerchantsByCategory({super.key,required this.categoryId});
  int categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getMerchantByCategory(categoryId) ,
      child: BlocBuilder<HomeCubit,HomeStates>(
        builder: (context, state) {
          if(state is LoadingMerchantByCategoryState){
            return Scaffold(body: Center(child: CircularProgressIndicator(),));
          }
          else if(state is SuccessMerchantByCategoryState){
            return  Scaffold(
              body: Column(
                children: [
                  CustomAppBar(title: "افضل المطاعم"),
                  29.ph(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36.w),
                      child: GridView.builder(
                        itemCount: state.merchants.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return MerchantWidget(merchant: state.merchants[index],);
                        },
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 170 / 214,
                          crossAxisSpacing: 17.w,
                          mainAxisSpacing: 20.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          else {
            state as ErrorMerchantByCategoryState;
            return Scaffold(body: Center(child: Text(state.error),));
          }

        },
        buildWhen: (previous, current) {
          if (current is LoadingMerchantByCategoryState) {
            return true;
          } else if (current is SuccessMerchantByCategoryState) {
            return true;
          } else if (current is ErrorMerchantByCategoryState) {
            return true;
          } else {
            return false;
          }
        } ,

      ),
    );
  }
}


