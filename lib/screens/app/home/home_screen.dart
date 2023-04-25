// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapakem/cubit/bottom_navigation_bar/bottom_navigation_cubit.dart';
import 'package:sapakem/cubit/bottom_navigation_bar/bottom_navigation_state.dart';
import 'package:sapakem/model/bn_screen.dart';
import 'package:sapakem/screens/btn/cart_screen_widget.dart';
import 'package:sapakem/screens/btn/home_screen_widget.dart';
import 'package:sapakem/screens/btn/order_screens/order_screen_widget.dart';
import 'package:sapakem/screens/btn/profile_screen_widget.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/widgets/home/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<BNScreen> screens = [
    BNScreen(title: 'home', widget: HomeScreenWidget()),
     BNScreen(title: 'cart', widget: CartScreenWidget()),
    const BNScreen(title: 'order', widget: OrderScreenWidget()),
    BNScreen(title: 'profile', widget: ProfileScreenWidget()),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, page) {
          return Scaffold(
              drawer: const AppDrawer(),
              extendBodyBehindAppBar: true,
              extendBody: true,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home_outlined),
                    label: context.localizations.home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: context.localizations.cart,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.bike_scooter_outlined),
                    label: context.localizations.orders,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person_2_outlined),
                    label: context.localizations.profile,
                  ),
                ],
                currentIndex: page.pageIndex,
                iconSize: 25,
                selectedItemColor: Colors.blue,
                unselectedItemColor: const Color(0xffB6B7B7),
                showUnselectedLabels: true,
                onTap: (index) {
                  context.read<BottomNavigationCubit>().changePage(index);
                },
              ),
              body: screens[page.pageIndex].widget);
        },
      ),
    );
  }
}
