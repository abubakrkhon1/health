import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:health/features/clinic/ui/clinic_page.dart';
import 'package:health/features/notifications/ui/notifications_page.dart';
import 'package:health/shared/widgets/platform_page_searchcontainer.dart';
import 'package:health/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            SizedBox(height: 20),
            Text(
              'Search for clinics',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            SearchContainer(
              placeholder: 'Search clinics',
              onChanged: (value) => print('User searched: $value'),
            ),
            SizedBox(height: 20),
            _buildClinicCards(context),
            SizedBox(height: 32),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(child: content,)
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
            child: Text('Menu', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white)),
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
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '87P4+W46, Tashkent, Uzbekistan',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 16,
                    color: CupertinoColors.systemGrey,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'User',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.label,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Platform.isIOS) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              } else {
                Scaffold.of(context).openEndDrawer();
              }
            },
            child: Icon(
              Platform.isIOS ? CupertinoIcons.bell : Icons.menu,
              color: CupertinoColors.systemGrey,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
