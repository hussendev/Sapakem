import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 80.h,
              width: 100.w,
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
                  text: 'اسم المنتج',
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                AppText(
                  text: 'المكونات',
                  fontSize: 10.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
                AppText(
                  text: 'المكونات',
                  fontSize: 10.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
                AppText(
                  text: 'المكونات',
                  fontSize: 10.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
                AppText(
                  text: '₪ 30.0',
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
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: ' : ',
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: '2',
                  fontSize: 10.sp,
                  color: Colors.black,
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
