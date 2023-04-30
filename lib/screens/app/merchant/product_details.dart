import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sapakem/cubit/home/merchant/merchant_cubit.dart';
import 'package:sapakem/cubit/home/product/product_state.dart';
import 'package:sapakem/model/home/product.dart';
import 'package:sapakem/model/home/product_cart.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_button_widget.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';
import 'package:sapakem/widgets/merchant/increment_and_decrement_widget.dart';
import 'package:share_plus/share_plus.dart';

// import 'package:share_plus/share_plus.dart';

import '../../../cubit/home/product/product_cubit.dart';
import '../../../widgets/app_text.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.product, this.productCart});

  Product? product;
  ProductCart? productCart;
  int quntity = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ProductCubit.get(context).resetCounter();
        return true;
      },
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: Column(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  height: 850.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                          title: product != null
                              ? product!.name!
                              : productCart!.name!),
                      20.ph(),
                      Container(
                        // height: 300.h,
                        clipBehavior: Clip.antiAlias,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                          border:
                              Border.all(color: Colors.grey.shade600, width: 1),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(50),
                          width: 150.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(product != null
                                  ? product!.mainImage!
                                  : productCart!.mainImage!),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(
                                color: Colors.grey.shade600, width: 1),
                          ),

                          // height: double.infinity,
                        ),
                      ),
                      40.ph(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        // width: 200.w,
                        height: 40.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: context.localizations.price,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              color: Colors.blue,
                            ),
                            10.pw(),
                            AppText(
                              text:
                                  '${product != null ? product!.price! : productCart!.price!}\$',
                              fontSize: 20.sp,
                              isPriceoffer: true,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              color: Colors.blue,
                            ),
                            10.pw(),
                            AppText(
                              text:
                                  '${product != null ? product!.priceOffer! : productCart!.priceOffer!}\$',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              color: Colors.blue,
                            ),
                            const Spacer(),
                            Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.share),
                                  color: Colors.white,
                                  onPressed: () async {
                                    context.showIndicator();
                                    String urlImage = product!.mainImage!;
                                    final url = Uri.parse(urlImage);
                                    final response = await http.get(url);
                                    final bytes = response.bodyBytes;

                                    final temp = await getTemporaryDirectory();
                                    final path = '${temp.path}/image.jpg';
                                    File(path).writeAsBytesSync(bytes);
                                    Navigator.pop(context);
                                    Share.shareFiles(
                                      [path],
                                      text: 'Product Name: ${product!.name}\n'
                                          'Price: ${product!.price}\n'
                                          'Price Offer: ${product!.priceOffer}\n'
                                          'Quantity: ${product!.quantity}\n'
                                          'Description: ${product!.description}',
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.ph(),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          // height: 250.h,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        AppText(
                                          text: context.localizations.type,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                          color: Colors.black,
                                        ),
                                        AppText(
                                          text: context.localizations.kg,
                                          fontSize: 16.sp,
                                          // fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        AppText(
                                          text: context.localizations.quantity,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                          color: Colors.black,
                                        ),
                                        AppText(
                                          text: product != null
                                              ? product!.quantity!.toString()
                                              : productCart!.quantity!
                                                  .toString(),
                                          fontSize: 16.sp,
                                          // fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        AppText(
                                          text: context.localizations.time,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                          color: Colors.black,
                                        ),
                                        AppText(
                                          text:
                                              '10 ${context.localizations.min}',
                                          fontSize: 16.sp,
                                          // fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              20.ph(),
                              SizedBox(
                                height: 160.h,
                                child: AppText(
                                    textAlign: TextAlign.left,
                                    text: product != null
                                        ? product!.description!
                                        : productCart!.description!,
                                    fontSize: 16.sp,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Visibility(
                    visible: !ProductCubit.get(context).isExitInCart(
                        product != null ? product!.id! : productCart!.id!,
                        product != null
                            ? product!.merchantId!
                            : productCart!.merchantId!),
                    replacement: AppText(
                      fontSize: 20.sp,
                      text: context.localizations.it_is_already_in_the_cart,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Row(
                      children: [
                        BlocBuilder<ProductCubit, ProductStates>(
                          buildWhen: (previous, current) {
                            if (current is IncrementProductState ||
                                current is DecrementProductState) {
                              return true;
                            }
                            return false;
                          },
                          builder: (context, state) {
                            if (state is InitialProductState) {
                              return incrementAndDecrementWidget(
                                  counter: state.counter);
                            } else if (state is IncrementProductState) {
                              return incrementAndDecrementWidget(
                                  counter: state.counter);
                            } else if (state is DecrementProductState) {
                              return incrementAndDecrementWidget(
                                  counter: state.counter);
                            } else {
                              return incrementAndDecrementWidget(counter: 0);
                            }
                          },
                        ),
                        10.pw(),
                        BlocConsumer<ProductCubit, ProductStates>(
                          listener: (context, state) {
                            if (state is ErrorAddProductState) {
                              context.showSnackBar(
                                  message: state.message, error: true);
                            } else if (state is ProcessProductState) {
                              context.showSnackBar(message: state.message);
                            }
                          },
                          listenWhen: (previous, current) {
                            if (current is ProcessProductState ||
                                current is ErrorAddProductState) {
                              return true;
                            }
                            return false;
                          },
                          buildWhen: (previous, current) {
                            if (current is LoadingProductState ||
                                current is ProcessProductState ||
                                current is ErrorAddProductState) {
                              return true;
                            }
                            return false;
                          },
                          builder: (context, state) {
                            if (state is LoadingProductState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is ProcessProductState ||
                                state is ErrorAddProductState) {
                              return Expanded(
                                flex: 2,
                                child: AppButton(
                                  color: Colors.white60,
                                  text: context.localizations.add_to_cart,
                                  onPressed: () {
                                    ProductCart productCart = getProductCart();
                                    productCart.quantity =
                                        context.read<ProductCubit>().quantity;
                                    context.read<ProductCubit>().addToCart(
                                        context: context,
                                        productCart: productCart,
                                        product: product!);


                                  },
                                ),
                              );
                            } else {
                              return Expanded(
                                flex: 2,
                                child: AppButton(
                                  color: Colors.white60,
                                  text: context.localizations.add_to_cart,
                                  onPressed: () {
                                    ProductCart productCart = getProductCart();

                                    productCart.quantity =
                                        context.read<ProductCubit>().quantity;
                                    context.read<ProductCubit>().addToCart(
                                      context: context,
                                        productCart: productCart,
                                        product: product!);


                                    // counter: ProductCubit.get(context).counter);
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  ProductCart getProductCart() {
    ProductCart productCart = ProductCart();
    productCart.id = product!.id;
    productCart.merchantId = product!.merchantId;
    productCart.merchantName = product!.merchantName;
    productCart.price = product!.price;
    productCart.name = product!.name;
    productCart.quantity = 0;
    productCart.priceOffer = product!.priceOffer;
    productCart.productUnit = product!.productUnit;
    productCart.mainImage = product!.mainImage;
    productCart.description = product!.description;

    return productCart;
  }
}
