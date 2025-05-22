import 'package:flutter/material.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/screens/onboarding_screen.dart';

void main() {
  bool isAuthed = false;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF4CAF50),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFF00ACC1),
          onSecondary: Color(0xFFFFFFFF),
          error: Color(0xFFE53935),
          onError: Color(0xFFFFFFFF),
          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFF212121),
        ),
      ),
      home: isAuthed ? HomeScreen() : OnboardingScreen(),
    ),
  );
}
