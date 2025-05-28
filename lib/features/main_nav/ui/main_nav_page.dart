import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/features/appointments/ui/appointments_page.dart';
import 'package:health/features/appointments/ui/new_appointment_page.dart';
import 'package:health/features/auth/services/auth_gate.dart';
import 'package:health/features/home/ui/home_screen.dart';

import 'package:health/features/medication/ui/medication_page.dart';
import 'package:health/features/profile/ui/profile_page.dart';
import 'package:health/shared/widgets/bottom_nav_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainNavigationPage extends ConsumerStatefulWidget {
  const MainNavigationPage({super.key});

  @override
  ConsumerState<MainNavigationPage> createState() => _MainNavigationPage();
}

class _MainNavigationPage extends ConsumerState<MainNavigationPage> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const MedicationPage(),
    const NewAppointmentPage(),
    const AppointmentsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final _currentIndex =
        ref
            .watch(bottomNavProvider.notifier)
            .state; // Add this line to access the current index

    print(_currentIndex); // Add this line to print the current index
    return AuthGate(
      child: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: _buildCustomNavBar(),
      ),
    );
  }

  Widget _buildCustomNavBar() {
    final currentIndex = ref.watch(bottomNavProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: LucideIcons.home,
                label: 'Home',
                index: 0,
                isSelected: currentIndex == 0,
              ),
              _buildNavItem(
                icon: LucideIcons.pill,
                label: 'Medications',
                index: 1,
                isSelected: currentIndex == 1,
              ),
              _buildNavItem(
                icon: null,
                label: 'Add',
                index: 2,
                isSelected: currentIndex == 2,
                isAddButton: true,
              ),
              _buildNavItem(
                icon: LucideIcons.calendar,
                label: 'Appointments',
                index: 3,
                isSelected: currentIndex == 3,
              ),
              _buildNavItem(
                icon: LucideIcons.user,
                label: 'Profile',
                index: 4,
                isSelected: currentIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    IconData? icon,
    required String label,
    required int index,
    required bool isSelected,
    bool isAddButton = false,
  }) {
    return GestureDetector(
      onTap: () => ref.read(bottomNavProvider.notifier).state = index,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 2),
            if (isAddButton)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF007AFF),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF007AFF).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  LucideIcons.plus,
                  color: Colors.white,
                  size: 20,
                ),
              )
            else
              Icon(
                icon,
                size: 24,
                color: isSelected ? const Color(0xFF007AFF) : Colors.grey[600],
              ),
            const SizedBox(height: 4),
            if (isSelected && !isAddButton)
              Container(
                width: 32,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFF007AFF),
                  borderRadius: BorderRadius.circular(2),
                ),
              )
            else
              const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
