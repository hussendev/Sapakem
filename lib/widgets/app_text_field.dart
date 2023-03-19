import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:sapakem/widgets/app_text.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hinttext,
    required this.text,
    required this.labeltext,
    required this.keyboardType,
    this.obscuresText = false,
    required this.controller,
    this.suffixIcon,
    required obscureText,
  }) : super(key: key);
  final String text;
  final String hinttext;
  final String labeltext;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscuresText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: text, fontSize: 14.sp, color: const Color(0xff222222)),
        10.ph(),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscuresText,
          decoration: InputDecoration(
            // labelText: labeltext,
            hintText: hinttext,
            hintStyle: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7C7A7B)),
            hintMaxLines: 1,
            // suffixIconColor:const Color(0xffF3651F),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xff1C8ABB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xff1C8ABB)),
            ),
            // enabledBorder: buildOutlineInputBorder(color:focusedBorderColor),
            // focusedBorder: buildOutlineInputBorder(color:focusedBorderColor),
          ),
        ),
      ],
    );
  }
}







// TextField(
// // keyboardType: TextInputType.number,
// decoration: InputDecoration(
// // labelText: 'Phone',
// // hintText: 'Enter Your Phone Number',
// floatingLabelBehavior: FloatingLabelBehavior.always,
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(28),
// borderSide: BorderSide(color: Color(0xff8b8b8b)),
// gapPadding: 10
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(28),
// borderSide: BorderSide(color: Color(0xff8b8b8b)),
// gapPadding: 10
// ),
// suffixIcon: Icon(Icons.phone),
//
//
// ),
// ),
//
//
