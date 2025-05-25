import 'package:flutter/material.dart';
import 'package:health/shared/widgets/appointment_card.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';

const appointmentsList = [
  {
    'appointmentType': 'Upcoming Appointment',
    'doctor': 'Dr. Lorraine',
    'date': 'Thu, 13/8',
    'time': '10:30',
    'doctorType': 'Cardiologist',
  },
  {
    'appointmentType': 'Upcoming Appointment',
    'doctor': 'Dr. Kwon',
    'date': 'Mon, 13/8',
    'time': '14:30',
    'doctorType': 'Ophtalmologist',
  },
  {
    'appointmentType': 'Upcoming Appointment',
    'doctor': 'Dr. Cooper',
    'date': 'Mon, 13/8',
    'time': '15:30',
    'doctorType': 'Endocrinologist',
  },
];

const pastAppointmentsList = [
  {
    'appointmentType': 'Past Appointment',
    'doctor': 'Dr. Lorraine',
    'date': 'Thu, 13/8',
    'time': '10:30',
    'doctorType': 'Cardiologist',
  },
  {
    'appointmentType': 'Past Appointment',
    'doctor': 'Dr. Kwon',
    'date': 'Mon, 13/8',
    'time': '14:30',
    'doctorType': 'Ophtalmologist',
  },
  {
    'appointmentType': 'Past Appointment',
    'doctor': 'Dr. Cooper',
    'date': 'Mon, 13/8',
    'time': '15:30',
    'doctorType': 'Endocrinologist',
  },
  {
    'appointmentType': 'Past Appointment',
    'doctor': 'Dr. Lorraine',
    'date': 'Thu, 13/8',
    'time': '10:30',
    'doctorType': 'Cardiologist',
  },
  {
    'appointmentType': 'Past Appointment',
    'doctor': 'Dr. Kwon',
    'date': 'Mon, 13/8',
    'time': '14:30',
    'doctorType': 'Ophtalmologist',
  },
  {
    'appointmentType': 'Past Appointment',
    'doctor': 'Dr. Cooper',
    'date': 'Mon, 13/8',
    'time': '15:30',
    'doctorType': 'Endocrinologist',
  },
];

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key, this.title});

  final String? title;

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  bool showUpcoming = true;

  @override
  Widget build(BuildContext context) {
    final currentList = showUpcoming ? appointmentsList : pastAppointmentsList;

    return PlatformScaffold(
      title: widget.title,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Schedule title
                Text(
                  'Appointments',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Toggle Buttons
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => showUpcoming = true),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color:
                                  showUpcoming
                                      ? Colors.white
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Text(
                              'Upcoming',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color:
                                    showUpcoming ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => showUpcoming = false),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color:
                                  !showUpcoming
                                      ? Colors.white
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Text(
                              'Past',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color:
                                    !showUpcoming ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Appointments List
                ...currentList.map((appointment) {
                  return appointmentCard(
                    context: context,
                    appointmentType: appointment['appointmentType']!,
                    time: appointment['time']!,
                    doctor: appointment['doctor']!,
                    date: appointment['date']!,
                    doctorType: appointment['doctorType']!,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
