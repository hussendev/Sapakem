import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/update_profile/update_profile_cubit.dart';
import 'package:sapakem/cubit/auth/update_profile/update_profile_state.dart';
import 'package:sapakem/cubit/language/language_cubit.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:sapakem/widgets/app_text_field.dart';
import 'package:sapakem/widgets/custom_app_bar.dart';

import '../../widgets/profile/profile_information_widget.dart';

class ProfileScreenWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ProfileScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    nameController.text = SharedPrefController().getValueFor(PrefKeys.name.name);
    emailController.text = SharedPrefController().getValueFor(PrefKeys.email.name);
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
                  // height: 567.h,
                  width: double.infinity,
                  child: Column(
                    children: [
                      30.ph(),
                      AppText(text: nameController.text, fontSize: 25.sp, color: Colors.black),
                      5.ph(),
                      AppText(text: emailController.text, fontSize: 15.sp, color: const Color(0xffA0A3AB)),
                      32.ph(),
                      ProfileInformationWidget(
                        icon: Icons.person,
                        text: context.localizations.edit_profile,
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return BlocBuilder<UpdateProfileCubit, UpdateProfileStates>(
                                builder: (context, state) {
                                  if (state is LoadingUpdateProfileState) {
                                    return const Center(child: CircularProgressIndicator());
                                  } else if (state is SuccessUpdateProfileState || state is ErrorDataUpdateProfileState || state is InitialUpdateProfileState) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                        // border: Border(
                                        //   top: BorderSide(color: Colors.black, width: 1),
                                        // ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 20.h),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  AppText(
                                                    text: context.localizations.update_profile,
                                                    fontSize: 35.sp,
                                                    color: const Color(0xff1C8ABB),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  14.ph(),
                                                  AppText(text: context.localizations.create_a_new_account_for_yourself, fontSize: 18.sp, color: const Color(0xff222222)),
                                                  21.ph(),
                                                  SizedBox(
                                                    height: 108.h,
                                                    child: AppTextField(
                                                      text: context.localizations.full_name,
                                                      hinttext: SharedPrefController().getValueFor(PrefKeys.name.name),
                                                      labeltext: 'labeltext',
                                                      keyboardType: TextInputType.name,
                                                      controller: nameController,
                                                      obscureText: false,
                                                    ),
                                                    // decoration: const BoxDecoration(shape: BoxShape.circle),
                                                  ),
                                                  10.ph(),
                                                  AppTextField(
                                                    text: context.localizations.mobile,
                                                    hinttext: "594 358 404",
                                                    labeltext: 'labeltext',
                                                    keyboardType: TextInputType.phone,
                                                    controller: phoneController..text = SharedPrefController().getValueFor(PrefKeys.mobile.name),
                                                    obscureText: false,
                                                  ),
                                                  10.ph(),
                                                  AppTextField(
                                                    text: context.localizations.email,
                                                    hinttext: "test@gmail.com",
                                                    labeltext: 'labeltext',
                                                    keyboardType: TextInputType.emailAddress,
                                                    controller: emailController..text = SharedPrefController().getValueFor(PrefKeys.email.name),
                                                    obscureText: false,
                                                  ),
                                                  25.ph(),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      context.read<UpdateProfileCubit>().updateProfile(
                                                            name: nameController.text,
                                                            // lastNameController.text,
                                                            email: emailController.text,
                                                            mobile: phoneController.text,
                                                            context: context,
                                                          );
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      primary: const Color(0xff1C8ABB),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10.r),
                                                      ),
                                                      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),
                                                    ),
                                                    child: AppText(
                                                      text: context.localizations.update,
                                                      fontSize: 20.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    state as ErrorUpdateProfileState;
                                    return Center(
                                      child: Text(state.message),
                                    );
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                      20.ph(),
                      ProfileInformationWidget(
                        icon: Icons.location_on_rounded,
                        text: context.localizations.address,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/location',
                          );
                        },
                      ),
                      20.ph(),
                      ProfileInformationWidget(icon: Icons.email_outlined, text: context.localizations.email),
                      20.ph(),
                      ProfileInformationWidget(
                        icon: Icons.language,
                        text: context.localizations.language,
                        onTap: () {
                          const languages = ['ar', 'en', 'he'];
                          const fullNameLanguages = ['عربي', 'English', 'עִברִית'];
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  for (var index = 0; index < languages.length; index++)
                                    InkWell(
                                      onTap: () {
                                        context.read<LanguageCubit>().changeLanguage(languages[index]);
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 30.h),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                                              decoration: const BoxDecoration(
                                                color: Color(0xff1C8ABB),
                                                shape: BoxShape.circle,
                                              ),
                                              child: AppText(text: languages[index], fontSize: 20.sp, color: Colors.white),
                                            ),
                                            AppText(text: fullNameLanguages[index], fontSize: 18.sp, color: Colors.black54)
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
                      20.ph(),
                      ProfileInformationWidget(icon: Icons.monetization_on_outlined, text: context.localizations.request_to_be_merchant),
                      20.ph(),
                      ProfileInformationWidget(
                          icon: Icons.login_outlined,
                          text: context.localizations.logout,
                          onTap: () {
                            UsersApiController().logout();
                            return Navigator.pushNamedAndRemoveUntil(context, '/login_screen', (route) => false);
                          }),
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
