import 'package:flutter/material.dart';
import 'package:health/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/user.png', width: 150),
                SizedBox(height: 15),
                Text(
                  'Savannah Cooper, 67',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Card(
                        color: AppColors.primary,
                        child: ListTile(
                          leading: Icon(
                            Icons.person_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          title: Text(
                            'Profile',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: ListTile(
                          leading: Icon(Icons.medication, size: 30),
                          title: Text(
                            'Medications',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: ListTile(
                          leading: Icon(Icons.calendar_month, size: 30),
                          title: Text(
                            'Appointments',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: ListTile(
                          leading: Icon(Icons.card_membership, size: 30),
                          title: Text(
                            'Medical Card',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: ListTile(
                          leading: Icon(Icons.settings_outlined, size: 30),
                          title: Text(
                            'Settings',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: ListTile(
                          leading: Icon(Icons.logout, size: 30),
                          title: Text(
                            'Logout',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
