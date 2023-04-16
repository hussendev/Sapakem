import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/app/home_api_controller.dart';
import 'package:sapakem/cubit/home/home_cubit.dart';
import 'package:sapakem/cubit/home/home_states.dart';
import 'package:sapakem/model/home/merchant.dart';
import 'package:sapakem/screens/app/merchant/merchant_screen.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';

import '../../widgets/app_text.dart';
import '../../widgets/home_category_widget.dart';
import '../../widgets/home_merchant_category.dart';
import '../../widgets/home_sub_category_widget.dart';

class HomeScreenWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        buildWhen: (previous, current) {
          if (current is SuccessHomeState) {
            return true;
          } else if (current is LoadingHomeState) {
            return true;
          } else if (current is ErrorHomeState) {
            return true;
          } else {
            return false;
          }
        } ,
        builder: (context, state) {
          if (state is LoadingHomeState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is SuccessHomeState) {

            return RefreshIndicator(
              onRefresh: () async{
                context.read<HomeCubit>().getHomeData();
              },
              child: Column(
                children: [
                  CustomAppBar(isHome: true, title: 'الموقع'),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 26.4.w,
                        end: 38.6.w,
                      ),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 184.h,
                            child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 400.0,
                                  enlargeCenterPage: true,
                                  // viewportFraction: 0.9,
                                  aspectRatio: 2.0,
                                ),
                                items: state.homeDate.banners!.map((e) {
                                  return InkWell(
                                    onTap: () async{

                                      //

                                    },
                                    child: Container(
                                      height: 184.h,
                                      decoration:  BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                               e.image!),
                                            fit: BoxFit.fill),
                                        color: Color(0xff1C8ABB),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                      ),
                                    ),
                                  );
                                }).toList()),
                          ),
                          34.ph(),
                          SizedBox(
                            height: 33.h,
                            child: Row(
                              children: [
                                AppText(
                                    text: context.localizations.main_meals,
                                    fontSize: 21.sp,
                                    color: Colors.blue),
                                const Spacer(),
                                SizedBox(
                                  height: 20.04.h,
                                  // width: 68.w,
                                  child: Row(
                                    children: [
                                      AppText(
                                          text: context.localizations.show_more,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.black),
                                      5.pw(),
                                      const Icon(Icons.arrow_forward_ios,
                                          color: Colors.black, size: 10),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          9.ph(),
                          HomeSubCategoryWidget(categories: state.homeDate.categories!),
                          17.ph(),

                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return  HomeMerchantCategory(titles: state.homeDate.titles![index], );
                            },
                            itemCount: state.homeDate.titles!.length,
                          ),
                          //  HomeMerchantCategory(),

                          // const HomeMerchantCategory(),
                          20.ph()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          else {
            state as ErrorHomeState;
            return Center(
              child: Text(state.error),
            );
          }
        },
      ),
    );
  }
}
