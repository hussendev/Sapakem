import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapakem/cubit/language/language_cubit.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/util/app_colors_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

class ChoseLanguage extends StatelessWidget {
  const ChoseLanguage({Key? key}) : super(key: key);

  // final cubit = LanguageCubit();

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
                text: AppLocalizations.of(context)!.chose_language,
                fontSize: 26.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            19.ph(),
            GestureDetector(
              onTap: () {
                context.read<LanguageCubit>().changeLanguage('he');
                 SharedPrefController().saveLanguage('en');
                Navigator.pushReplacementNamed(context, '/on_boarding');
              },
              child: Container(
                alignment: Alignment.center,
                height: 42.h,
                margin: EdgeInsets.symmetric(horizontal: 148.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.w,
                  ),
                ),
                child: AppText(
                  text: 'עִברִית',
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            11.ph(),
            GestureDetector(
              onTap: () {
                context.read<LanguageCubit>().changeLanguage('ar');
                SharedPrefController().saveLanguage('ar');
                Navigator.pushReplacementNamed(context, '/on_boarding');
              },
              child: Container(
                alignment: Alignment.center,
                height: 42.h,
                margin: EdgeInsets.symmetric(horizontal: 148.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.w,
                  ),
                ),
                child: AppText(
                  text: 'العربية',
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            11.ph(),
            GestureDetector(
              onTap: () {
                context.read<LanguageCubit>().changeLanguage('en');
                 SharedPrefController().saveLanguage('en');
                Navigator.pushReplacementNamed(context, '/on_boarding');
              },
              child: Container(
                alignment: Alignment.center,
                height: 42.h,
                margin: EdgeInsets.symmetric(horizontal: 148.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.w,
                  ),
                ),
                child: AppText(
                  text: 'English',
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
