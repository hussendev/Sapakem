import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/screens/app/home/merchants_by_category.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

import '../model/home/categories.dart';

class HomeSubCategoryWidget extends StatelessWidget {
  HomeSubCategoryWidget({
    required this.categories,
    super.key,
  });

  List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    // print();
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              InkWell(
                onTap: () async {
                  // Logger().i(categories[index].id);
                  Future.delayed(Duration(milliseconds: 500), () {
                    // context
                    //     .read<HomeCubit>()
                    //     .getMerchantByCategory(categories[index].id!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MerchantsByCategory(category: categories[index]),
                      ),
                    );
                  });

                  // context.read<HomeCubit>().getMerchantByCategory(categories[index].id!);
                  // HomeApiController().getMerchantByCategory(1).then((value){
                  //   Logger().i(value.first.storeName!);
                  // });
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left:
                            context.localizations.language == 'en' ? 0.w : 10.w,
                        right:
                            context.localizations.language == 'en' ? 10.w : 0.w,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              categories[index].image!),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      width: 65.w,
                      height: 65.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: AppText(
                        text: categories[index].name!,
                        fontSize: 16.sp,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
              10.pw(),
            ],
          );
        },
      ),
    );
  }
}
