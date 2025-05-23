import 'package:flutter/material.dart';
import 'package:health/features/main_nav/ui/main_nav_page.dart';
// import 'package:health/features/main_nav/ui/main_nav_page.dart';
import 'package:health/features/onboarding/ui/onboarding_screen.dart';
import 'package:health/theme/app_colors.dart';
// import 'package:health/features/onboarding/ui/onboarding_screen.dart';

void main() {
  // bool isAuthed = true;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColors.background,
        scaffoldBackgroundColor: AppColors.background
      ),
      home: MainNavigationPage(),
    ),
  );
}
