import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/util/app_colors_extenssion.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/profile/profile_information_widget.dart';

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
                AppText(text: SharedPrefController().getValueFor(PrefKeys.name.name), fontSize: 20.sp, color: Colors.black),
                20.ph(),
                ProfileInformationWidget(
                  icon: Icons.location_on_outlined,
                  text: context.localizations.location,
                ),
                27.ph(),
                ProfileInformationWidget(
                  icon: Icons.language,
                  text: context.localizations.chose_language,
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
                  icon: Icons.language,
                  text: context.localizations.chose_language,
                ),
                27.ph(),
                ProfileInformationWidget(
                  icon: Icons.logout,
                  text: context.localizations.logout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
