import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_homehaven/features/home/screen/homepage_screen.dart';
import 'package:ecommerce_homehaven/features/home/screen/login_screen.dart';
import 'package:ecommerce_homehaven/features/home/screen/profile_info_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screen = [
    HomepageScreen(),
    LoginScreen(),
    ProfileInfoScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.primaryVariant,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: screen[selectedIndex],
    );
  }
}