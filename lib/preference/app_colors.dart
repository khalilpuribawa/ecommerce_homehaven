import 'package:flutter/material.dart';

class AppColors {
  // Private constructor
  AppColors._();

  // Warna dasar
  static const Color primary = Color(0xFF156651);
  static const Color primaryVariant = Color(0xFF115543);
  static const Color discount = Color(0xffE44A4A);
  static const Color background = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
  static const Color stars = Color(0xffEBB65B);
  static const Color blackcolor = Color(0xFF000000);

  // Warna tambahan
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey900 = Color(0xFF212121);

  static Color? onPrimary;

  // Gradien warna
  static LinearGradient get primaryGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryVariant],
  );

  static LinearGradient get blueGradient =>
      LinearGradient(colors: [Color(0xFF2196F3), Color(0xFF21CBF3)]);

  static LinearGradient get purpleGradient =>
      LinearGradient(colors: [Color(0xFF9C27B0), Color(0xFFE91E63)]);

  // Method untuk membuat custom gradient
  static LinearGradient customGradient({
    required List<Color> colors,
    Alignment begin = Alignment.centerLeft,
    Alignment end = Alignment.centerRight,
    TileMode tileMode = TileMode.clamp,
  }) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: colors,
      tileMode: tileMode,
    );
  }
}
