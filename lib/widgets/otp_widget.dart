import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPWidget extends StatelessWidget {
   OTPWidget( this.otp,{
    super.key,

  });
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.h,
      width: 64.w,
      child: TextFormField(
        controller: TextEditingController(text: otp),

        keyboardType: TextInputType.phone,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(

          hintText: "*",
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff1C8ABB)),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff1C8ABB)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }

  // i want function that for otp when i type 1 number it will go to next textfield and when escapse it will go to previous textfield
}
