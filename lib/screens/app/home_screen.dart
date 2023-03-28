// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sapakem/model/bn_screen.dart';
import 'package:sapakem/screens/btn/cart_screen_widget.dart';
import 'package:sapakem/screens/btn/home_screen_widget.dart';
import 'package:sapakem/screens/btn/order_screens/order_screen_widget.dart';
import 'package:sapakem/screens/btn/profile_screen_widget.dart';
import 'package:sapakem/widgets/home/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BNScreen> screens = [
    const BNScreen(title: 'home', widget: HomeScreenWidget()),
    const BNScreen(title: 'cart', widget: CartScreenWidget()),
    const BNScreen(title: 'order', widget: OrderScreenWidget()),
    const BNScreen(title: 'profile', widget: ProfileScreenWidget()),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
        // floatingActionButton: FloatingActionButton(
        //   mini: true,
        //   onPressed: () {},
        //   backgroundColor: Colors.blue,
        //   child: const Icon(Icons.person),
        // ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'רָאשִׁי',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'סַל',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bike_scooter_outlined),
              label: 'הבקשות שלי',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'פּרוֹפִיל',
            ),
          ],
          currentIndex: currentIndex,
          iconSize: 25,
          selectedItemColor: Colors.blue,
          unselectedItemColor: const Color(0xffB6B7B7),
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: screens[currentIndex].widget);
  }
}
