import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/screens/app/home/merchants_by_category.dart';
import 'package:sapakem/screens/auth/chose_sign_up_register_screen.dart';
import 'package:sapakem/screens/app/home/home_screen.dart';
import 'package:sapakem/screens/auth/forgot_password_screen.dart';
import 'package:sapakem/screens/auth/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sapakem/screens/auth/new_password_screen.dart';
import 'package:sapakem/screens/auth/otp_screen.dart';
import 'package:sapakem/screens/auth/register_screen.dart';
import 'package:sapakem/screens/chose_language.dart';
import 'package:sapakem/screens/launch_screen.dart';
import 'package:sapakem/screens/onboarding/on_boarding.dart';
import 'package:sapakem/util/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  Bloc.observer = MyBlocObserver();
  int deviceType = Platform.isAndroid ? 0: 1;

  await Firebase.initializeApp(
  );
  // Get the FCM token
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
    await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      SharedPrefController().saveFcmTokenAndLatLongAndDeviceType(fcmToken: fcmToken!,lat:position.latitude,lng:position.longitude,deviceType:deviceType);
    }).catchError((e) {
      Logger().wtf(e);
    });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.black),
                titleTextStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            initialRoute: '/lunch_screen',
            routes: {
              '/login_screen': (context) => LoginScreen(),
              '/register_screen': (context) =>  RegisterScreen(),
              '/forgot_password_screen': (context) =>
                  const ForgetPasswordScreen(),
              '/otp_screen': (context) =>  OTPScreen(),
              '/new_password_screen': (context) => const NewPasswordScreen(),
              '/lunch_screen': (context) => const LunchScreen(),
              '/on_boarding': (context) => OnBoarding(),
              '/chose_language': (context) => const ChoseLanguage(),
              '/chose_sign_up_or_register': (context) =>
                  const ChoseSignUpOrRegister(),
              '/home_screen': (context) => const HomeScreen(),
              '/merchants_by_category': (context) =>
                  const MerchantsByCategory(),
            },
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English
              Locale('ar', ''), // Arabic
              Locale('he', ''), // Hebrew
            ],
            locale: const Locale('en', ''));
      },
    );
  }
}
