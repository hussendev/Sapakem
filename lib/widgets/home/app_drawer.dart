import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/screens/app/profile/location.dart';
import 'package:sapakem/util/app_colors_extenssion.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/profile/profile_information_widget.dart';

import '../../cubit/language/language_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 0.28.sh,
            child: Stack(
              children: [
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: app_primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(180.r),
                      bottomRight: Radius.circular(180.r),
                    ),
                  ),
                ),
                Positioned(
                  top: 150.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: app_primary,
                        width: 2.w,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/avatar.svg',
                      height: 50.h,
                      width: 50.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                AppText(
                    text:
                        SharedPrefController().getValueFor(PrefKeys.name.name),
                    fontSize: 20.sp,
                    color: Colors.black),
                20.ph(),
                // ProfileInformationWidget(
                //   icon: Icons.location_on_outlined,
                //   text: context.localizations.location,
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => MyMapPage(),
                //       ),
                //     );
                //   },
                // ),
                // 27.ph(),
                ProfileInformationWidget(
                  icon: Icons.language,
                  text: context.localizations.chose_language,
                  onTap: () {
                    const languages = ['ar', 'en', 'he'];
                    const fullNameLanguages = ['عربي', 'English', 'עִברִית'];
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (var index = 0;
                                index < languages.length;
                                index++)
                              InkWell(
                                onTap: () {
                                  context
                                      .read<LanguageCubit>()
                                      .changeLanguage(languages[index]);
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30.h),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 10.h),
                                        decoration: const BoxDecoration(
                                          color: Color(0xff1C8ABB),
                                          shape: BoxShape.circle,
                                        ),
                                        child: AppText(
                                            text: languages[index],
                                            fontSize: 20.sp,
                                            color: Colors.white),
                                      ),
                                      AppText(
                                          text: fullNameLanguages[index],
                                          fontSize: 18.sp,
                                          color: Colors.black54)
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                27.ph(),
                ProfileInformationWidget(
                  icon: Icons.favorite,
                  text: context.localizations.favorite,
                  onTap: () {
                    Navigator.pushNamed(context, '/favorite_screen');
                  },
                ),
                27.ph(),
                ProfileInformationWidget(
                  icon: Icons.share_sharp,
                  text: context.localizations.share_app,
                ),
                27.ph(),
                ProfileInformationWidget(
                  icon: Icons.logout,
                  text: context.localizations.logout,
                  onTap: () {
                    UsersApiController().logout();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login_screen', (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
