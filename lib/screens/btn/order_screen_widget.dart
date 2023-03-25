import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_bar_container_widget.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderScreenWidget extends StatefulWidget {
  const OrderScreenWidget({super.key});

  @override
  State<OrderScreenWidget> createState() => _OrderScreenWidgetState();
}

class _OrderScreenWidgetState extends State<OrderScreenWidget> {
  int indexPageSelected = 0;

  Decoration decorationSelectedButton = BoxDecoration(
    color: const Color(0xff1C8ABB),
    borderRadius: BorderRadius.circular(28.r),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        blurRadius: 8,
        offset: const Offset(5, 5),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppLocalizations.of(context)!.my_requests),
          Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                31.ph(),
                Container(
                  height: 56.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 34.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 8,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                indexPageSelected = 0;
                              },
                            );
                          },
                          child: Container(
                            height: 56.h,
                            decoration: indexPageSelected == 0 ? decorationSelectedButton : null,
                            child: Center(
                              child: AppText(
                                text: AppLocalizations.of(context)!.my_current_requests,
                                fontSize: 14.sp,
                                color: indexPageSelected == 0 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                indexPageSelected = 1;
                              },
                            );
                          },
                          child: Container(
                            height: 56.h,
                            decoration: indexPageSelected == 1 ? decorationSelectedButton : null,
                            child: Center(
                              child: AppText(
                                text: AppLocalizations.of(context)!.my_previous_requests,
                                fontSize: 14.sp,
                                color: indexPageSelected == 1 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                25.ph(),
              ],
            ),
          ),
          38.ph(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 35.w,
              vertical: 41.h
            ),
            child: Stack(
              children: [
                Positioned(child: SvgPicture.asset('assets/delevari_alhelal.svg')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
