import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: Color(0xFF042954),
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF042954)),
    appBarTheme: AppBarTheme(
      color: const Color(0xFFfdc400),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
