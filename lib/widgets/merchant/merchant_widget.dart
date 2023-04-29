import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/cubit/home/home_cubit.dart';
import 'package:sapakem/cubit/home/merchant/merchant_cubit.dart';
import 'package:sapakem/cubit/home/merchant/merchant_states.dart';
import 'package:sapakem/model/home/merchant.dart';

import '../../screens/app/merchant/merchant_screen.dart';

class MerchantWidget extends StatelessWidget {
  MerchantWidget({
    super.key,
    required this.merchant,
  });

  Merchant merchant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeCubit>().getMerchantById(merchant.id!);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MerchantScreen(
              merchant: merchant,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 214.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(merchant.merchantLogo!),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.red,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: const BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          merchant.storeName!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'address',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          merchant.mobile!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          width: 36.12.w,
                          decoration: BoxDecoration(
                            color: merchant.isOpen! ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 15.05.h,
                          child: Center(
                            child: Text(
                              merchant.isOpen! ? 'مفتوح' : 'مغلق',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const Spacer(),
                    BlocBuilder<MerchantCubit, MerchantStates>(
                      builder: (context, state) {
                        return InkWell(
                          child: context
                                  .read<MerchantCubit>()
                                  .isMerchantFavorite(merchant)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                          onTap: () {
                            context
                                .read<MerchantCubit>()
                                .addMerchantToFavorites(merchant);
                          },
                        );
                      },
                      buildWhen: (previous, current) =>
                          current is FavoriteMerchantState ||
                          current is InitialFavoriteMerchantState,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
