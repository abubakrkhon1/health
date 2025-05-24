import 'package:flutter/material.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: 'Settings',
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}