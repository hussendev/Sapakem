import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/util/app_colors_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChoseSignUpOrRegister extends StatelessWidget {
  const ChoseSignUpOrRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              app_primary,
              app_primary_light,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            61.ph(),
            SvgPicture.asset('assets/lunch_screen_logo.svg'),
            78.2.ph(),
            Center(
              child: AppText(
                text: AppLocalizations.of(context)!.welcome_for_you,
                fontSize: 34.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            40.ph(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppText(
                text: AppLocalizations.of(context)!.enjoy_the_fastest_and_best_network_in_the_world,
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ),
            30.ph(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login_screen');
              },
              child: Container(
                alignment: Alignment.center,
                height: 60.h,
                margin: EdgeInsets.symmetric(horizontal: 35.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.w,
                  ),
                ),
                child: AppText(
                  text: AppLocalizations.of(context)!.login,
                  fontSize: 16.sp,
                  color: app_primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            14.ph(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register_screen');
              },
              child: Container(
                alignment: Alignment.center,
                height: 60.h,
                margin: EdgeInsets.symmetric(horizontal: 35.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.w,
                  ),
                ),
                child: AppText(
                  text: AppLocalizations.of(context)!.sign_up,
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
