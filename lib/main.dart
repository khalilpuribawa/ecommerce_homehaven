import 'package:ecommerce_homehaven/features/home/screen/homepage_screen.dart';
import 'package:ecommerce_homehaven/features/home/screen/login_screen.dart';
import 'package:ecommerce_homehaven/features/home/screen/main_screen/main_screen.dart';
import 'package:ecommerce_homehaven/features/home/screen/product_detail.dart';
import 'package:ecommerce_homehaven/features/home/screen/profile_info_screen.dart';
import 'package:ecommerce_homehaven/features/splash/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: const Color(0xFF4CAF50)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Manrope',
      ),

      home: const SplashScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/homescreen': (context) => const HomepageScreen(),
        '/mainscreen': (context) => const MainScreen(),
        '/profile': (context) => const ProfileInfoScreen(),
        '/product-detail': (context) => const ProductDetailScreen(),
      },
    );
  }
}
