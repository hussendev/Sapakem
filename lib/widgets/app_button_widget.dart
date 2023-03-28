// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.height = 60,
  });
  double width;
  double height;

  late String text;
  late VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color.fromARGB(255, 22, 134, 199),
          minimumSize: Size(width.w, height.h)),
      child: AppText(
          text: text,
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500),
    );
  }
}
