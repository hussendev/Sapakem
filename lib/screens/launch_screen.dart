import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/cubit/auth/city/city_cubit.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/screens/app/home/home_screen.dart';
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
    CityCubit.get(context).getCities();

    _checkFirstSeen().then((value){
      if (value) {
        String route =
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)==null
                ? '/login_screen'
                : '/home_screen';
        Future.delayed(const Duration(seconds: 1), () async {
          Navigator.pushReplacementNamed(context, route);
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () async {
          Navigator.pushReplacementNamed(context, '/chose_language');
        });
      }


    });

    // Logger().d(_checkFirstSeen() == true);
    // if (_checkFirstSeen() == true) {
    //   Future.delayed(const Duration(seconds: 1), () async {
    //     Navigator.pushReplacementNamed(context, '/home_screen');
    //   });
    // } else {
    //   Future.delayed(const Duration(seconds: 1), () async {
    //     Navigator.pushReplacementNamed(context, '/chose_language');
    //   });
    // }


    // Future.delayed(const Duration(seconds: 1), () async {
    //   Navigator.pushReplacementNamed(context, route);
    // });
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


  //check if the user first time open the app or not

  Future<bool> _checkFirstSeen() async {

    bool _seen = (SharedPrefController().getValueFor(PrefKeys.seen.name) ?? false);

    if (_seen) {
      return true;
    } else {
       SharedPrefController().saveSeen(true);
       return false;

    }
  }



}
