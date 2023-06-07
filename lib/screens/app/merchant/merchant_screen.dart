import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/cubit/home/home_cubit.dart';
import 'package:sapakem/cubit/home/home_states.dart';
import 'package:sapakem/cubit/home/merchant/merchant_cubit.dart';
import 'package:sapakem/model/home/merchant.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';

import '../../../widgets/app_text.dart';
import '../../../widgets/merchant/information_merchant_widget.dart';
import '../../../widgets/merchant/products_for_merchant_widget.dart';

class MerchantScreen extends StatelessWidget {
  MerchantScreen({super.key, required this.merchant});

  Merchant? merchant;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
        create: (context) => HomeCubit()..getMerchantById(merchant!.id!),
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is LoadingMerchantsState) {
              return const Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              ));
            } else if (state is SuccessMerchantState) {
              return RefreshIndicator(
                onRefresh: () async {
                  HomeCubit.get(context)
                      .getMerchantById(merchant!.id!, isRefresh: true);
                  context
                      .read<MerchantCubit>()
                      .getStatusForMerchant(context, merchant!.id!.toString());
                },
                child: Scaffold(
                    extendBodyBehindAppBar: true,
                    body: ListView(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 248,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          merchant!.merchantBackground!),
                                      fit: BoxFit.cover)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 25.h),
                                    height: 44.h,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            height: 30,
                                            width: 30,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: context.localizations
                                                        .language ==
                                                    'en'
                                                ? const Icon(
                                                    Icons
                                                        .arrow_circle_left_outlined,
                                                    color: Colors.black)
                                                : const Icon(
                                                    Icons
                                                        .arrow_circle_right_outlined,
                                                    color: Colors.black),
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/cart_screen');
                                          },
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            height: 44.h,
                                            width: 44.w,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child:
                                                const Icon(Icons.shopping_cart),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 220.h, left: 37.w, right: 37.w),
                              height: 111.h,
                              width: 112.w,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      state.merchant.merchantLogo!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                        9.ph(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 36.w),
                          child: Column(
                            children: [
                              InformationMerchantWidget(
                                merchant: state.merchant,
                              ),
                              31.ph(),
                              state.merchant.products!.isEmpty
                                  ? Center(
                                      child: AppText(
                                          text:
                                              ' No Products for this merchant',
                                          fontSize: 20.sp,
                                          color: Colors.black),
                                    )
                                  : SizedBox(
                                      height: 250.h,
                                      child: ListView.builder(
                                        itemBuilder: (context, index) {
                                          return ProductsForMerchantWidget(
                                            products: state.merchant.products!,
                                          );
                                        },
                                        itemCount: state
                                            .merchant.subcategories!.length,
                                      ),
                                    ),
                              30.ph(),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            } else {
              state as ErrorMerchantState;
              return Scaffold(
                body: Center(
                  child: Text(state.error),
                ),
              );
            }
          },
          buildWhen: (previous, current) {
            if (current is SuccessMerchantState ||
                current is ErrorMerchantState ||
                current is LoadingMerchantsState) {
              return true;
            }
            return false;
          },
        ));
  }
}
