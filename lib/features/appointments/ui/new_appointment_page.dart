import 'package:flutter/cupertino.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';

class  NewAppointmentPage extends StatelessWidget {
  const  NewAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: 'New Appointment',
      body: Center(
        child: Text('New Appointment'),
      )
    );
  }
}