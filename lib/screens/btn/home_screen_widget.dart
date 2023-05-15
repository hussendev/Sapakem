import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/cubit/home/home_cubit.dart';
import 'package:sapakem/cubit/home/home_states.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/screens/app/home/show_more.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';

import '../../widgets/app_text.dart';
import '../../widgets/home_category_widget.dart';
import '../../widgets/home_merchant_category.dart';
import '../app/merchant/merchant_screen.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      lazy: true,
      child: BlocBuilder<HomeCubit, HomeStates>(
        buildWhen: (previous, current) {
          if (current is SuccessHomeState) {
            return true;
          } else if (current is LoadingHomeState) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, state) {
          if (state is LoadingHomeState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SuccessHomeState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeCubit>().getHomeData(isRefresh: true);
              },
              child: Column(
                children: [
                  CustomAppBar(isHome: true, title: SharedPrefController().getValueFor(PrefKeys.cityName.name) ?? ''),
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
                                    onTap: () async {
                                      //  context.read<HomeCubit>().getMerchantById(e.merchantId!);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MerchantScreen(
                                            merchant: e.merchant,
                                          ),
                                        ),
                                      );

                                      //
                                    },
                                    child: Container(
                                      height: 184.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: CachedNetworkImageProvider(e.bannerImg!), fit: BoxFit.fill),
                                        color: const Color(0xff1C8ABB),
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                AppText(text: context.localizations.main_meals, fontSize: 21.sp, color: Colors.blue),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShowMore(categories: state.homeDate.categories!),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height: 20.04.h,
                                    child: Row(
                                      children: [
                                        AppText(text: context.localizations.show_more, fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.black),
                                        5.pw(),
                                        const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          9.ph(),
                          HomeSubCategoryWidget(categories: state.homeDate.categories!),
                          17.ph(),

                          for (var i = 0; i < state.homeDate.titles!.length; i++)
                            HomeMerchantCategory(
                              titles: state.homeDate.titles![i],
                            ),

                          // ListView.builder(
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   itemBuilder: (context, index) {

                          //   },
                          //   itemCount: state.homeDate.titles!.length,
                          // ),

                          // const HomeMerchantCategory(),
                          20.ph()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
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
