import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/model/orderDetails.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

class ItemOrder extends StatelessWidget {
  final OrderDetails? order;

  ItemOrder({this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: const Center(
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
            ),
            9.pw(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Product Name:',
                  fontSize: 12.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
                AppText(
                  text: order!.productName!,
                  fontSize: 12.sp,
                  color: Colors.black54,
                  // fontWeight: FontWeight.w400,
                ),
                AppText(
                  text: 'Merchant Name: ',
                  fontSize: 12.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
                AppText(
                  text: order!.merchantName!,
                  fontSize: 12.sp,
                  color: Colors.black54,
                  // fontWeight: FontWeight.w700,
                ),
                AppText(
                  text: 'Total: ',
                  fontSize: 12.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
                AppText(
                  text: '${order!.total!}',
                  fontSize: 12.sp,
                  color: Colors.black54,
                  // fontWeight: FontWeight.w700,
                ),
                AppText(
                  text: '₪ ${order!.price!}',
                  fontSize: 16.sp,
                  color: const Color(0xff1C8ABB),
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  text: AppLocalizations.of(context)!.quantity,
                  fontSize: 10.sp,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: ' : ',
                  fontSize: 10.sp,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: order!.quantity!.toString(),
                  fontSize: 10.sp,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
