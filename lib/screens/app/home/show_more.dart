import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/model/home/categories.dart';
import 'package:sapakem/model/home/merchant.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';
import 'package:sapakem/widgets/home_category_widget.dart';
import 'package:sapakem/widgets/merchant/merchant_widget.dart';

// ignore: must_be_immutable
class ShowMore extends StatelessWidget {
  List<Categories>? categories;
  List<Merchant>? merchants;

  ShowMore({
    this.categories,
    this.merchants,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(isHome: true, title: context.localizations.show_more),
          if (merchants != null)
            GridView.builder(
              itemCount: merchants!.length,
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              itemBuilder: (context, index) {
                return MerchantWidget(
                  merchant: merchants![index],
                );
              },
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 170 / 214,
                crossAxisSpacing: 17.w,
                mainAxisSpacing: 20.h,
              ),
            ),
          if (categories != null)
            Padding(
              padding: EdgeInsets.all(20.w),
              child: HomeSubCategoryWidget(categories: categories!),
            ),
          if (categories == null && merchants == null)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 100, color: Colors.grey),
                Text(
                  context.localizations.sorry_no_data_to_show,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            )
        ],
      ),
    );
  }
}
