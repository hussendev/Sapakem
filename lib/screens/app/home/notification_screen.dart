import 'package:flutter/material.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/notification/notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "الاشعارات"),
          // 40.ph(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const NotificationWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
