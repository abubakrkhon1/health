import 'package:flutter/material.dart';
import 'package:health/features/notifications/ui/notifications_page.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:health/features/appointments/ui/appointments_page.dart';
import 'package:health/features/profile/ui/insurance_page.dart';
import 'package:health/features/profile/ui/medical_card_page.dart';
import 'package:health/features/profile/ui/profile_settings_page.dart';
import 'package:health/features/profile/ui/settings_page.dart';
import 'package:health/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(LucideIcons.bell),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Profile Card
              GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileSettingsPage(),
                      ),
                    ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Userov',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'beby@gmail.com',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '+123-456-78-90',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: const Icon(LucideIcons.edit, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // General Label
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'General',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Setting Items
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SettingItem(
                      icon: LucideIcons.user,
                      color: Colors.lightBlue,
                      title: 'Account Information',
                      subtitle: 'Change your account information',
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProfileSettingsPage(),
                            ),
                          ),
                    ),
                    SettingItem(
                      icon: LucideIcons.heartPulse,
                      color: Colors.green,
                      title: 'Insurance Detail',
                      subtitle: 'Add your insurance info',
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => InsurancePage()),
                          ),
                    ),
                    SettingItem(
                      icon: LucideIcons.fileText,
                      color: Colors.orange,
                      title: 'Medical Records',
                      subtitle: 'History about your medical records',
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MedicalCardPage(),
                            ),
                          ),
                    ),
                    SettingItem(
                      icon: LucideIcons.shieldCheck,
                      color: Colors.purple,
                      title: 'Clinic Info',
                      subtitle: 'Information about our Clinic',
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AppointmentsPage(title: ''),
                            ),
                          ),
                    ),
                    SettingItem(
                      icon: LucideIcons.settings,
                      color: Colors.blue,
                      title: 'Settings',
                      subtitle: 'Manage & Settings',
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SettingsPage()),
                          ),
                    ),
                    SettingItem(
                      icon: LucideIcons.logOut,
                      color: Colors.redAccent,
                      title: 'Logout',
                      subtitle: 'Log out from your account',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color color;

  const SettingItem({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 22, color: color),
        ),
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600)),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey.shade600, fontSize: 13),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
