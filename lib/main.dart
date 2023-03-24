import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapakem/screens/app/restaurants_by_category.dart';
import 'package:sapakem/screens/auth/chose_sign_up_register_screen.dart';
import 'package:sapakem/screens/app/home_screen.dart';
import 'package:sapakem/screens/auth/forgot_password_screen.dart';
import 'package:sapakem/screens/auth/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sapakem/screens/auth/new_password_screen.dart';
import 'package:sapakem/screens/auth/otp_screen.dart';
import 'package:sapakem/screens/auth/register_screen.dart';
import 'package:sapakem/screens/chose_language.dart';
import 'package:sapakem/screens/launch_screen.dart';
import 'package:sapakem/screens/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
            initialRoute: '/home_screen',
            routes: {
              '/login_screen': (context) => LoginScreen(),
              '/register_screen': (context) => const RegisterScreen(),
              '/forgot_password_screen': (context) =>
                  const ForgetPasswordScreen(),
              '/otp_screen': (context) => const OTPScreen(),
              '/new_password_screen': (context) => const NewPasswordScreen(),
              '/lunch_screen': (context) => const LunchScreen(),
              '/on_boarding': (context) => OnBoarding(),
              '/chose_language': (context) => const ChoseLanguage(),
              '/chose_sign_up_or_register': (context) =>
                  const ChoseSignUpOrRegister(),
              '/home_screen': (context) => HomeScreen(),
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
            locale: const Locale('he', ''));
      },
    );
  }
}
