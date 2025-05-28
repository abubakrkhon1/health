import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';
import 'package:health/shared/widgets/user_provider.dart';

class ProfileSettingsPage extends ConsumerWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.notifier).state;
    return PlatformScaffold(
      title: 'Profile Settings',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user?.id ?? 'ID'),
            Text(user?.fullName ?? 'No name'),
            Text(user?.email ?? 'Email'),
            Text(user?.gender ?? 'Gender'),
            Text(user?.dob ?? 'DOB'),
            Text(user?.phone ?? 'Phone'), 
          ],
        ),
      ),
    );
  }
}
