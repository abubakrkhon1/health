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
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            SearchContainer(
              placeholder: 'Search clinics',
              onChanged: (value) => print('User searched: $value'),
            ),
            SizedBox(height: 16),
            _buildClinicCards(context),
            SizedBox(height: 26),
            Text(
              'Search for clinics',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(child: content)
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
            child: Text('Menu', style: TextStyle(color: Colors.white)),
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
                color:
                    Platform.isIOS
                        ? CupertinoColors.activeBlue
                        : Theme.of(context).primaryColor,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OFTOB MEDLINE',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '87P4+W46, Tashkent, Uzbekistan',
                      style: TextStyle(
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
    return ListTile(
      contentPadding: EdgeInsets.only(top: 20, left: 15, right: 15),
      leading: CircleAvatar(
        radius: 32,
        backgroundImage: AssetImage('assets/images/user.png'),
      ),
      title: Text('Hello,'),
      subtitle: Text(
        'User',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing:
          Platform.isAndroid
              ? GestureDetector(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: Icon(Icons.menu),
              )
              : GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsPage(),
                      ),
                    ),
                child: Icon(Icons.notifications_outlined),
              ),
    );
  }
}
