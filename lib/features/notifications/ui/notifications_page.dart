import 'package:flutter/material.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: 'Notifications',
      body: const Center(child: Text('Notifications')),
    );
  }
}
