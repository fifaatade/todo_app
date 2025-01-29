import 'package:flutter/material.dart';


class AppColors {
  static const Color primary = Color(0xFF00BFA6);
  static const Color secondary = Color(0xFF00E5FF);
  static const Color accent = Color(0xFF00E676);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color darkGrey = Color(0xFF424242);
  static const Color background = Color(0xFFE0F7FA);
}
class AppFonts {
  static const TextStyle heading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle body = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle small = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}

class AppCheckbox {
  static const Decoration checked = BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.accent,
  );
  static const Decoration unchecked = BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.darkGrey,
  );
}