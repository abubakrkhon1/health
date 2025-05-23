import 'package:flutter/material.dart';

import 'package:health/features/appointments/ui/appointments_page.dart';
import 'package:health/features/home/ui/home_screen.dart';
import 'package:health/features/medication/ui/medication_page.dart';
import 'package:health/features/profile/ui/profile_page.dart';
import 'package:health/theme/app_colors.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final _pages = const [
    HomeScreen(),
    MedicationPage(),
    AppointmentsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.dark,
        unselectedItemColor: AppColors.primary,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.medication_rounded), label: 'Medication'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: 'Appointments'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
