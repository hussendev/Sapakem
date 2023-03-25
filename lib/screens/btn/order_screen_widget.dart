import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sapakem/widgets/app_bar_container_widget.dart';

class OrderScreenWidget extends StatelessWidget {
  const OrderScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarContainerWidget(
              widget:
              const Icon(Icons.menu, color: Color(0xff1C8ABB)),
              width: 44.w),
        ],
      )
    );
  }
}
