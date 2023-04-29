import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sapakem/cubit/home/product/product_cubit.dart';

import 'package:sapakem/model/home/product_cart.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

import '../../screens/app/merchant/product_details.dart';

class CartItemWidget extends StatelessWidget {
  CartItemWidget({
    super.key,
    required this.length,
    required this.data,
  });

  int length;
  List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          ProductCart product = ProductCart.fromJson(data[index]);
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ProductDetailsScreen(
                    product: null,
                    productCart: product,
                  );
                },
              ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.h),
              height: 59.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    product.mainImage!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            height: 59.h,
                            width: 84.w,
                          ),
                          InkWell(
                            onTap: () {
                              // Logger().i('remove product from cart');
                              context
                                  .read<ProductCubit>()
                                  .removeProductFromCart(
                                      product.id!, product.merchantId!);
                            },
                            child: Container(
                              width: 12.w,
                              height: 12.h,
                              decoration: const BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.close_rounded,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      5.pw(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: product.name!,
                              fontSize: 13.sp,
                              color: Colors.black),
                          AppText(
                              text: product.priceOffer!.toString(),
                              fontSize: 13.sp,
                              color: const Color(0xff1C8ABB)),
                        ],
                      ),
                    ],
                  ),
                  AppText(
                      text:
                          '${context.localizations.quantity} : ${product.quantity!}',
                      fontSize: 12.sp,
                      color: Colors.black)
                ],
              ),
            ),
          );
        },
        itemCount: length,
      ),
    );
  }
}
