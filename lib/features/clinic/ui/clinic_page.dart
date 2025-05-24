import 'package:flutter/material.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';

class ClinicPage extends StatelessWidget {
  const ClinicPage({super.key, required this.clinic});

  final Map<String, dynamic> clinic;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: clinic['name'],
      body: Center(child: Text(clinic['name'])),
    );
  }
}
