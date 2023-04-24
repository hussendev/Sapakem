
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/cubit/home/product/producr_cubit.dart';
import 'package:sapakem/cubit/home/product/product_state.dart';
import 'package:sapakem/model/home/product.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/widgets/app_button_widget.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';
import 'package:sapakem/widgets/merchant/increment_and_decrement_widget.dart';

import '../../../widgets/app_text.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({required this.product});

  Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    CustomAppBar(title: "اسم المنتج"),
                    SizedBox(
                      height: 20.h,
                    ),
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
                        margin: EdgeInsets.all(50),
                        width: 150.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(product.mainImage!),
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
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      width: 200.w,
                      height: 40.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: product.price!.toString(),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            color: Colors.blue,
                          ),
                          AppText(
                            text: "السعر",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.share_outlined,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 250.h,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  AppText(
                                    text: "نوع",
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    color: Colors.black,
                                  ),
                                  AppText(
                                    text: 'كيلو',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              Container(
                                height: 50.h,
                                width: 1,
                                color: Colors.black,
                              ),
                              Column(
                                children: [
                                  AppText(
                                    text: "وقت التحضير",
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    color: Colors.black,
                                  ),
                                  AppText(
                                    text: '30 دقيقة',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              Container(
                                height: 50.h,
                                width: 1,
                                color: Colors.black,
                              ),
                              Column(
                                children: [
                                  AppText(
                                    text: "وقت الاستلام",
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    color: Colors.black,
                                  ),
                                  AppText(
                                    text: '30 دقيقة',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 160.h,
                            child: AppText(
                                textAlign: TextAlign.left,
                                text: product.description!,
                                fontSize: 16.sp,
                                color: Colors.black),
                          )
                        ],
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
                child: Row(
                  children: [
                    BlocBuilder<ProductCubit,ProductStates>(
                      buildWhen: (previous, current) {
                        if(current is IncrementProductState || current is DecrementProductState){
                          return true;
                        }
                        return false;
                      } ,
                      builder:(context, state) {
                        if(state is InitialProductState){
                          return  incrementAndDecrementWidget(counter:state.counter);
                        }else if(state is IncrementProductState){
                          return  incrementAndDecrementWidget(counter:state.counter);
                        }else if(state is DecrementProductState) {
                          return  incrementAndDecrementWidget(counter:state.counter);
                        }else{
                          return  incrementAndDecrementWidget(counter:0);
                        }
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    BlocConsumer<ProductCubit,ProductStates>(
                      listener: (context, state) {
                        if(state is AlraedyInCartProductState){
                          context.showSnackBar(message: state.message,error: true);
                        }else if(state is SuccessAddProductState){
                          context.showSnackBar(message: state.message);
                        }
                      },
                      listenWhen: (previous, current) {
                        if(current is SuccessAddProductState || current is AlraedyInCartProductState){
                          return true;
                        }
                        return false;
                      },
                      buildWhen: (previous, current) {
                        if(current is LoadingProductState || current is SuccessAddProductState || current is AlraedyInCartProductState){
                          return true;
                        }
                        return false;
                      } ,
                      builder:(context, state) {
                        if(state is LoadingProductState){
                          return Center(child: CircularProgressIndicator(),);
                        }else if(state is SuccessAddProductState ||state is AlraedyInCartProductState){
                          return  Expanded(
                            flex: 2,
                            child: AppButton(
                              color: Colors.white60,
                              text:context.localizations.add_to_cart,
                              onPressed: () {
                                context.read<ProductCubit>().addToCart(product: product);
                                // ProductCubit.get(context).addToCart(
                                //     product: product);


                                Logger().i(   context.read<ProductCubit>().cart);
                                // counter: ProductCubit.get(context).counter);
                              },
                            ),
                          );
                        } else{
                          return  Expanded(
                            flex: 2,
                            child: AppButton(
                              color: Colors.white60,
                              text: context.localizations.add_to_cart,
                              onPressed: () {
                                context.read<ProductCubit>().addToCart(product: product);
                                // ProductCubit.get(context).addToCart(
                                //     product: product);


                                Logger().i(   context.read<ProductCubit>().cart);
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
            )
          ],
        ));
  }
}


