import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapakem/screens/auth/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sapakem/screens/auth/register_screen.dart';

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
            initialRoute: '/login_screen',
            routes: {
              // '/launch_screen': (context) => LaunchScreen(),
              // '/on_boarding_screen': (context) => OnBoardingScreen(),
              '/login_screen': (context) => const LoginScreen(),
              '/register_screen': (context) => const RegisterScreen(),
              // '/register_success_screen': (context) => RegisterSuccess(),
              // '/forgot_password_screen': (context) => ForgetPasswordScreen(),
              // '/reset_password_screen': (context) => ResetPasswordScreen(),
              // '/home_screen': (context) => HomeScreen(),
              // '/bottom_screen': (context) => BottomNavigationScreen(),
              // // '/products_screen':(context)=> ProductsScreen(),
              // // '/subcategories_screen':(context)=> SubCategoriesScreen(id: id),
              // '/categories_screen': (context) => CategoriesScreen(),
              // // '/product_details_screen':(context)=> ProductDetailsScreen(),
              // // '/cart_screen':(context)=> CartScreen(),
              // '/cart_screen': (context) => CartScreen(),
              // '/profile_screen': (context) => ProfileScreen(),
              // '/setting_screen': (context) => SettingScreen(),
              // '/orders_screen': (context) => OrdersScreen(),
              // '/order_details_screen': (context) => OrderDetailsScreen(),
              // '/address_screen': (context) => AddressScreen(),
              // '/delivery_details_screen': (context) => DeliveryDetails(),
              // '/cridt_card_screen': (context) => CridtCard(),
              // '/all_address_screen': (context) => AllAddress(),
              // '/notifications_screen': (context) => Notifications(),
              // '/edit_phone_screen_screen': (context) => EditPhoneNumber(),
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
