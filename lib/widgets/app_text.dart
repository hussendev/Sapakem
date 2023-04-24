// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  FontWeight fontWeight;
  TextAlign? textAlign;
  bool isPriceoffer;

  AppText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.textAlign,
    this.isPriceoffer = false,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: isPriceoffer
          ? GoogleFonts.poppins(
        wordSpacing:2 ,
              textBaseline: TextBaseline.alphabetic,
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.solid,

              decorationThickness: 2.2,
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
            )
          : GoogleFonts.poppins(
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
            ),
    );
    // );
  }
}
