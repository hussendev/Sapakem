// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/cubit/auth/city/city_cubit.dart';
import 'package:sapakem/cubit/auth/city/city_states.dart';
import 'package:sapakem/cubit/auth/register/register_cubit.dart';
import 'package:sapakem/cubit/auth/register/register_states.dart';
import 'package:sapakem/model/city.dart';
import 'package:sapakem/model/user_register.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<City> cities = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            context.localizations.language == 'en'
                ? Icons.arrow_circle_left_outlined
                : Icons.arrow_circle_right_outlined,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: BlocProvider<RegisterCubit>(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          builder: (context, state) {
            if (state is LoadingRegisterState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessRegisterState ||
                state is ErrorDataRegisterState ||
                state is initialRegisterState) {
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -215.h,
                                child: Container(
                                  height: 430.h,
                                  width: 430.w,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(200),
                                      bottomRight: Radius.circular(200),
                                    ),
                                    color: Colors.blue,
                                    // shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 170.h,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset('assets/logo.svg',
                                      semanticsLabel: 'A red up arrow'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        25.ph(),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 36.w, vertical: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    text: context
                                        .localizations.create_your_account,
                                    fontSize: 35.sp,
                                    color: const Color(0xff1C8ABB)),
                                14.ph(),
                                AppText(
                                    text: context.localizations
                                        .create_a_new_account_for_yourself,
                                    fontSize: 18.sp,
                                    color: const Color(0xff222222)),
                                21.ph(),
                                SizedBox(
                                    height: 108.h,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: AppTextField(
                                              text: context
                                                  .localizations.first_name,
                                              hinttext: '594  358  404',
                                              labeltext: 'labeltext',
                                              keyboardType: TextInputType.name,
                                              controller: firstNameController,
                                              obscureText: false),
                                        ),
                                        10.pw(),
                                        Expanded(
                                          flex: 1,
                                          child: AppTextField(
                                              text: context
                                                  .localizations.last_name,
                                              hinttext: 'moh',
                                              labeltext: 'labeltext',
                                              keyboardType: TextInputType.name,
                                              controller: lastNameController,
                                              obscureText: false),
                                        ),
                                      ],
                                    )

                                    // decoration: const BoxDecoration(shape: BoxShape.circle),
                                    ),
                                10.ph(),
                                AppTextField(
                                    text: context.localizations.mobile,
                                    hinttext: "594  358  404",
                                    labeltext: 'labeltext',
                                    keyboardType: TextInputType.phone,
                                    controller: phoneController,
                                    obscureText: false),
                                10.ph(),
                                AppTextField(
                                    text: context.localizations.email,
                                    hinttext: "test@gmail.com",
                                    labeltext: 'labeltext',
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    obscureText: false),
                                10.ph(),
                                AppText(
                                    text: 'City',
                                    fontSize: 20.sp,
                                    color: Colors.black),
                                10.ph(),
                                BlocBuilder<CityCubit, CityStates>(
                                  builder: (context, state) {
                                    if (state is CityLoadingState) {
                                      return DropdownButtonFormField<String>(
                                          decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                    color: Color(0xff1C8ABB)),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                    color: Color(0xff1C8ABB)),
                                              )),
                                          value: 'Loading...',
                                          items: const [],
                                          onChanged: (value) {});
                                    } else if (state is CitySuccessState) {
                                      return DropdownButtonFormField<City>(
                                          decoration: const InputDecoration(
                                              hintText: 'Please Select City',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                    color: Color(0xff1C8ABB)),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                    color: Color(0xff1C8ABB)),
                                              )),
                                          value: state.cities.first,
                                          items: state.cities
                                              .map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e.name ?? ''),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            context
                                                .read<CityCubit>()
                                                .ChangeCity(value!);
                                          });
                                    } else {
                                      state as CityErrorState;
                                      return Text(state.error);
                                    }
                                  },
                                  buildWhen: (previous, current) {
                                    if (current is CitySuccessState ||
                                        state is CityInitialState) {
                                      return true;
                                    }
                                    return false;
                                  },
                                ),
                                10.ph(),
                                // DropdownButtonFormField(items:, onChanged: onChanged)
                                BlocBuilder<RegisterCubit, RegisterStates>(
                                  builder: (context, state) {
                                    if (state is initialRegisterState) {
                                      return Column(
                                        children: [
                                          AppTextField(
                                              text: context
                                                  .localizations.password,
                                              hinttext: '********',
                                              labeltext: 'labeltext',
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              controller: passwordController,
                                              obscureText: true,
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  Logger().i('message');
                                                  context
                                                      .read<RegisterCubit>()
                                                      .changePasswordVisibilityForPassword();
                                                },
                                                icon: const Icon(
                                                  Icons.visibility_off_outlined,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                          10.ph(),
                                          AppTextField(
                                              text: context.localizations
                                                  .confirm_password,
                                              hinttext: '***********',
                                              labeltext: 'labeltext',
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              controller:
                                                  confirmPasswordController,
                                              suffixIcon: const Icon(
                                                Icons.visibility_off_outlined,
                                                size: 25,
                                                color: Colors.grey,
                                              ),
                                              obscureText: true),
                                        ],
                                      );
                                    } else if (state
                                        is ChangePasswordVisibilityForPassword) {
                                      return Column(
                                        children: [
                                          AppTextField(
                                              text: context
                                                  .localizations.password,
                                              hinttext: '********',
                                              labeltext: 'labeltext',
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              controller: passwordController,
                                              obscureText: state
                                                  .visiblePasswordForPassword,
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  Logger().i('message');
                                                  context
                                                      .read<RegisterCubit>()
                                                      .changePasswordVisibilityForPassword();
                                                },
                                                icon: Icon(
                                                  state.visiblePasswordForPassword
                                                      ? Icons
                                                          .visibility_off_outlined
                                                      : Icons.visibility,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                          10.ph(),
                                          AppTextField(
                                              text: context.localizations
                                                  .confirm_password,
                                              hinttext: '***********',
                                              labeltext: 'labeltext',
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              controller:
                                                  confirmPasswordController,
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  Logger().i('message');
                                                  context
                                                      .read<RegisterCubit>()
                                                      .changePasswordVisibilityForPassword();
                                                },
                                                icon: Icon(
                                                  state.visiblePasswordForPassword
                                                      ? Icons
                                                          .visibility_off_outlined
                                                      : Icons.visibility,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              obscureText: state
                                                  .visiblePasswordForPassword),
                                        ],
                                      );
                                    } else {
                                      return Column(
                                        children: [
                                          AppTextField(
                                              text: context
                                                  .localizations.password,
                                              hinttext: '********',
                                              labeltext: 'labeltext',
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              controller: passwordController,
                                              obscureText: true,
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  Logger().i('message');
                                                  context
                                                      .read<RegisterCubit>()
                                                      .changePasswordVisibilityForPassword();
                                                },
                                                icon: const Icon(
                                                  Icons.visibility_off_outlined,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                          10.ph(),
                                          AppTextField(
                                              text: context.localizations
                                                  .confirm_password,
                                              hinttext: '***********',
                                              labeltext: 'labeltext',
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              controller:
                                                  confirmPasswordController,
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  Logger().i('message');
                                                  context
                                                      .read<RegisterCubit>()
                                                      .changePasswordVisibilityForPassword();
                                                },
                                                icon: const Icon(
                                                  Icons.visibility_off_outlined,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              obscureText: true),
                                        ],
                                      );
                                    }
                                  },
                                  buildWhen: (previous, current) {
                                    if (current
                                        is ChangePasswordVisibilityForPassword) {
                                      return true;
                                    }
                                    return false;
                                  },
                                ),

                                9.ph(),
                                25.ph(),
                                AppButton(
                                    text: context.localizations.sign_up,
                                    onPressed: () async {
                                      _performRegister(context);
                                    }),
                                29.ph(),
                                Row(
                                  children: [
                                    AppText(
                                        text: context.localizations
                                            .do_you_have_an_account,
                                        fontSize: 16.sp,
                                        color: const Color(0xff222222)),
                                    5.pw(),
                                    AppText(
                                        text: context.localizations.login,
                                        fontSize: 16.sp,
                                        color: const Color(0xff1C8ABB)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              state as ErrorRegisterState;
              return Center(
                child: Text(state.message),
              );
            }
          },
          listener: (context, state) {
            if (state is SuccessRegisterState) {
              context.showSnackBar(
                  message: state.message, error: !state.success);
              Navigator.pushReplacementNamed(context, '/login_screen');
            } else if (state is ErrorDataRegisterState) {
              context.showSnackBar(
                  message: state.message, error: !state.success);
            }
          },
          buildWhen: (previous, current) {
            if (current is SuccessRegisterState ||
                current is ErrorDataRegisterState ||
                current is LoadingRegisterState) {
              return true;
            }
            return false;
          },
        ),
      ),
    );
  }

  void _performRegister(BuildContext context) {
    if (_checkData(context)) {
      _register(context);
      SharedPrefController().savePhone(phoneController.text);
    } else {
      context.showSnackBar(message: 'Enter Required Data!', error: true);
    }
  }

  bool _checkData(BuildContext context) {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  void _register(BuildContext context) async {
    // Logger().i(user(context).toJson());
    RegisterCubit.get(context)
        .userRegister(user: user(context), context: context);
  }

  UserRegister user(BuildContext context) {
    UserRegister userRegister = UserRegister();
    userRegister.name =
        "${firstNameController.text} ${lastNameController.text}";
    userRegister.email = emailController.text;
    userRegister.password = passwordController.text;
    userRegister.mobile = int.parse(phoneController.text);
    userRegister.fcmToken =
        SharedPrefController().getValueFor(PrefKeys.fcmToken.name);
    userRegister.deviceType =
        int.parse(SharedPrefController().getValueFor(PrefKeys.deviceType.name));
    userRegister.cityId = CityCubit.get(context).cityId;
    return userRegister;
  }
//1560
}
