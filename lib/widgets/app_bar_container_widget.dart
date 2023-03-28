import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppBarContainerWidget extends StatelessWidget {
  AppBarContainerWidget({super.key, required this.widget, required this.width, this.onTap});
  final double height = 44.h;
  double width = 44.w;
  final Widget widget;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: widget,
      ),
    );
  }
}
