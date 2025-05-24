import 'package:flutter/material.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';

class MedicalCardPage extends StatelessWidget {
  const MedicalCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: 'Medical Card',
      body: Center(
        child: Text('Medical Card Page'),
      ),
    );
  }
}