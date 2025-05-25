import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:health/features/appointments/ui/appointments_page.dart';
import 'package:health/features/appointments/ui/new_appointment_page.dart';
import 'package:health/features/home/ui/home_screen.dart';
import 'package:health/features/medication/ui/medication_page.dart';
import 'package:health/features/profile/ui/profile_page.dart';
import 'package:health/shared/widgets/platform_page_navigation.dart';
import 'package:health/theme/app_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    NewAppointmentPage(),
    AppointmentsPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformMainNavigation(
      currentIndex: _currentIndex,
      pages: _pages,
      onTap: _onTabTapped,
      backgroundColor: AppColors.background,
      selectedItemColor: AppColors.dark,
      unselectedItemColor: AppColors.primary,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(LucideIcons.home, size: 30),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(LucideIcons.pill, size: 30),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(LucideIcons.plus, size: 30),
          label: '',
        ), // iOS "+" tab
        const BottomNavigationBarItem(
          icon: Icon(LucideIcons.calendar, size: 30),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(LucideIcons.user, size: 30),
          label: '',
        ),
      ],
    );
  }
}
