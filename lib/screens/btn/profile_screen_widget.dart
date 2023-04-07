import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/profile/profile_information_widget.dart';

class ProfileScreenWidget extends StatelessWidget {
  const ProfileScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: context.localizations.profile),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 75.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 567.h,
                  width: double.infinity,
                  child: Column(
                    children: [
                      30.ph(),
                      AppText(text: 'Hussen Ghabayen', fontSize: 25.sp, color: Colors.black),
                      5.ph(),
                      AppText(text: ' 054-1234567', fontSize: 15.sp, color: const Color(0xffA0A3AB)),
                      32.ph(),
                      ProfileInformationWidget(icon: Icons.person, text: context.localizations.edit_profile),
                      20.ph(),
                      ProfileInformationWidget(icon: Icons.location_on_rounded, text: context.localizations.address),
                      20.ph(),
                      ProfileInformationWidget(icon: Icons.email_outlined, text: context.localizations.email),
                      20.ph(),
                      ProfileInformationWidget(icon: Icons.language, text: context.localizations.language),
                      20.ph(),
                      ProfileInformationWidget(icon: Icons.monetization_on_outlined, text: context.localizations.request_to_be_merchant),
                      20.ph(),
                      ProfileInformationWidget(icon: Icons.login_outlined, text: context.localizations.logout,onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/login_screen', (route) => false)),
                      20.ph(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey),
                      left: BorderSide(width: 1.0, color: Colors.grey),
                      right: BorderSide(width: 1.0, color: Colors.grey),
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
