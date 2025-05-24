import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lucide_icons/lucide_icons.dart';

import 'package:health/features/clinic/ui/clinic_page.dart';
import 'package:health/features/notifications/ui/notifications_page.dart';
import 'package:health/features/profile/ui/profile_page.dart';
import 'package:health/shared/widgets/platform_page_searchcontainer.dart';
import 'package:health/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Quick Services',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(backgroundColor: Colors.white, child: content)
        : Scaffold(
          backgroundColor: AppColors.background,
          endDrawer: _appDrawer(context),
          body: content,
        );
  }

  Widget _appDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              'Menu',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
          ),
          ListTile(title: Text('Home'), onTap: () {}),
          ListTile(title: Text('Profile'), onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildClinicCards(BuildContext context) {
    Widget _clinicTile() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ClinicPage(clinic: {'name': 'OftobMedline'}),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 12),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Platform.isIOS ? CupertinoColors.systemGrey6 : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: CupertinoColors.separator, width: 0.6),
          ),
          child: Row(
            children: [
              Icon(
                Platform.isIOS ? CupertinoIcons.location : Icons.location_on,
                color: AppColors.primary,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OFTOB MEDLINE',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '87P4+W46, Tashkent, Uzbekistan',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        color: CupertinoColors.inactiveGray,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Platform.isIOS
                    ? CupertinoIcons.chevron_forward
                    : Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ),
      );
    }

    return Column(children: [_clinicTile(), _clinicTile(), _clinicTile()]);
  }

  Widget _header(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
          colors: [Colors.white, Color.fromARGB(255, 129, 230, 255)],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Platform.isIOS ? CupertinoColors.systemGrey6 : Colors.white,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsPage(),
                    ),
                  );
                },
                icon: Icon(LucideIcons.bell),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'User',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Have a nice day!',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(LucideIcons.siren, color: Colors.white),
                    label: Text(
                      'Urgent care',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 14,
                      ),
                      shape: StadiumBorder(),
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/doctor.png'),
            ],
          ),
        ],
      ),
    );
  }
}
