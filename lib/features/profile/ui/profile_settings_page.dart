import 'package:flutter/material.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: '',
      body: Center(
        child: Text('Profile settings Page'),
      ),
    );
  }
}