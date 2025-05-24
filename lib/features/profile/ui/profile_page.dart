import 'package:flutter/material.dart';
import 'package:health/features/appointments/ui/appointments_page.dart';
import 'package:health/features/medication/ui/medication_page.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/user.png', width: 150),
                  SizedBox(height: 15),
                  Text(
                    'Savannah Cooper, 67',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CardButton(
                          icon: Icons.person_outlined,
                          title: 'Profile',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileSettingsPage(),
                              ),
                            );
                          },
                        ),
                        CardButton(
                          icon: Icons.medication,
                          title: 'Medications',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MedicationPage(title:''),
                              ),
                            );
                          },
                        ),
                        CardButton(
                          icon: Icons.calendar_month,
                          title: 'Appointments',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentsPage(title:''),
                              ),
                            );
                          },
                        ),
                        CardButton(
                          icon: Icons.card_membership,
                          title: 'Medical Card',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MedicalCardPage(),
                              ),
                            );
                          },
                        ),
                        CardButton(
                          icon: Icons.health_and_safety_outlined,
                          title: 'Insurance',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InsurancePage(),
                              ),
                            );
                          },
                        ),
                        CardButton(
                          icon: Icons.settings_outlined,
                          title: 'Settings',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ),
                            );
                          },
                        ),
                        CardButton(
                          icon: Icons.logout,
                          title: 'Logout',
                          onPressed: () {
                            print('clicked on logout');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const CardButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 0,
        color: title == 'Profile' ? AppColors.primary : Colors.white,
        child: ListTile(
          leading: Icon(
            icon,
            color: title == 'Profile' ? Colors.white : Colors.black,
            size: 30,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 20,
              color: title == 'Profile' ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
