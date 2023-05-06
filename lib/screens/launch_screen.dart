import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapakem/cubit/auth/city/city_cubit.dart';
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
    CityCubit.get(context).getCities();

    String route =
        SharedPrefController().getValueFor<String>(PrefKeys.token.name) == null
            ? '/chose_language'
            : '/home_screen';

    Future.delayed(const Duration(seconds: 1), () async {
      // await SharedPrefController().saveToken(
      //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODMyMzU1YWFmYzU5NTk2YzE1N2E1MTI4N2Q3NjgwMmE2MDczOGExOGIzNGI2OTQwM2Y0NDAzYWJlZjM3NWUxY2JkMDQ5MjVlMzdlMWRmODciLCJpYXQiOjE2ODI3OTA1MjQuMDExOTIsIm5iZiI6MTY4Mjc5MDUyNC4wMTE5MjMsImV4cCI6MTcxNDQxMjkyNC4wMTA1MDgsInN1YiI6IjIxIiwic2NvcGVzIjpbXX0.oDXg2TCIbnSuZa9ILio5M9L1vzITzw9tuuu_bmVr2es2LpLDMF_Z9Gb8ZLl7hlalogx-g3KrVZLCH4tcoYPYbxlCWuryap43soMuISFu2qlu9k-Odssu-5GNNcJjMfiTlMEIE5aHLgr-YuiFF6rQVlGsXOLCPWFZrkSlrHfnxm4pfQ4ciGoGcNLtrwuPbr1SFC9KMLrwsF3h41WQ6dSF9koghRaKl3TbZyeAz0J27giJKyW8cpKLS4opLcMq_w-xJCsRc7uiv_m046KTMa2nFj1JjgIeuDZeiZipW-C1PBk8n7hFM8M2qCtNg19xTCOPdEesKZezwE1PcXnWpgElQwuFCNiGy3R3ha0TRZ4Y6g-XtkrrZ7UbQ1rQCFn0YZG_wAbUTbahxdJRnKh8LjTzl6HNSbImWwJc3Ocv9AF-YIIOV793pLRuNWNhDwGoithWbofp2tiPSlqh720Gam5-pZ7nkVMWGVvsk1Jl4fZcuEIdY-yb2sJEJmbbEq1ZZDs1NOO6xCd4ft3zMqSoA2AJuG8gf6vol25NAfgG0U6Mz-pnAhzG4PtUuujkR5dNgJKBoQgfxn-MFA3wxv95T1h7ltLYevK-SqIOU6DFEJwiagz_FlJuaR2ZAbBFEoSkhLcc5ycjv1WkibcvmVx5Jwth8ioTT1iKVeMucjvsmZdEVsY');
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
