import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/util/app_colors_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final Map onBoardingData = {
    'title': [
      'This is a title , no more that 50 word',
      'This is a title , no more that 50 word',
      'This is a title , no more that 50 word',
    ],
    'description': [
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam',
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam',
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam',
    ],
    'image': [
      'assets/on_boarding/on_boarding_1.svg',
      'assets/on_boarding/on_boarding_2.svg',
      'assets/on_boarding/on_boarding_3.svg',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF48B5E3),
              app_primary,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPageIndex = value;
                  });
                },
                children: [
                  for (int i = 0; i < 3; i++)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(0.1.sw)),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            SvgPicture.asset(
                              onBoardingData['image'][i],
                              fit: BoxFit.fitWidth,
                            ),
                          ]),
                        ),
                        20.ph(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 41.w),
                          child: AppText(
                            text: onBoardingData['title'][i],
                            fontSize: 32.sp,
                            color: Colors.white,
                          ),
                        ),
                        17.ph(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 41.w),
                          child: AppText(
                            text: onBoardingData['description'][i],
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                        if (i != 2) 110.ph(),
                        if (i == 2) 30.ph(),
                      ],
                    ),
                ],
              ),
            ),
            if (currentPageIndex != 2)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.w),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: currentPageIndex == 0 ? 20.w : 10.w,
                          height: 10.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        6.pw(),
                        Container(
                          width: currentPageIndex == 1 ? 20.w : 10.w,
                          height: 10.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        6.pw(),
                        Container(
                          width: currentPageIndex == 2 ? 20.w : 10.w,
                          height: 10.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        _pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      child: AppText(
                        text: AppLocalizations.of(context)!.skip,
                        fontSize: 21.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            if (currentPageIndex == 2)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chose_sign_up_or_register');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 0.2.sw, vertical: 0.02.sh),
                    ),
                    child: AppText(
                      text: AppLocalizations.of(context)!.get_started,
                      fontSize: 18.sp,
                      color: app_primary,
                    ),
                  ),
                  17.ph(),
                  TextButton(
                    onPressed: () {},
                    child: AppText(
                      text: AppLocalizations.of(context)!.continue_as_visitor,
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            44.ph(),
          ],
        ),
      ),
    );
  }
}
