import 'package:flutter/material.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';

class InsurancePage extends StatelessWidget {
  const InsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title:'Insurance',
      body: Center(
        child: Text('Insurance Page'),
      ),
    );
  }
}