import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  late String text;
  late VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Color.fromARGB(255, 22, 134, 199),
          minimumSize: Size(double.infinity, 60.h)),
      child: AppText(
          text: text,
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500),
    );
  }
}
