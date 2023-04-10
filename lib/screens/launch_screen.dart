import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/util/app_colors_extenssion.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String route = SharedPrefController().getValueFor<String>(PrefKeys.token.name) == null ? '/chose_language' : '/home_screen';

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_primary,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              app_primary,
              app_primary_light,
            ],
          ),
        ),
        child: Center(
          child: SvgPicture.asset('assets/lunch_screen_logo.svg'),
        ),
      ),
    );
  }
}
