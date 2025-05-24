import 'package:flutter/material.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';
import 'package:health/theme/app_colors.dart';

const appointmentsList = [
  {
    'doctor': 'Dr. Lorraine',
    'date': 'Thu, 13/8, 10:30',
    'doctorType': 'Cardiologist',
  },
  {
    'doctor': 'Dr. Kwon',
    'date': 'Mon, 13/8, 14:30',
    'doctorType': 'Ophtalmologist',
  },
  {
    'doctor': 'Dr. Cooper',
    'date': 'Mon, 13/8, 15:30',
    'doctorType': 'Endocrinologist',
  },
];

const pastAppointmentsList = [
  {
    'doctor': 'Dr. Lorraine',
    'date': 'Thu, 13/8, 10:30',
    'doctorType': 'Cardiologist',
  },
  {
    'doctor': 'Dr. Kwon',
    'date': 'Mon, 13/8, 14:30',
    'doctorType': 'Ophtalmologist',
  },
  {
    'doctor': 'Dr. Cooper',
    'date': 'Mon, 13/8, 15:30',
    'doctorType': 'Endocrinologist',
  },
  {
    'doctor': 'Dr. Lorraine',
    'date': 'Thu, 13/8, 10:30',
    'doctorType': 'Cardiologist',
  },
  {
    'doctor': 'Dr. Kwon',
    'date': 'Mon, 13/8, 14:30',
    'doctorType': 'Ophtalmologist',
  },
  {
    'doctor': 'Dr. Cooper',
    'date': 'Mon, 13/8, 15:30',
    'doctorType': 'Endocrinologist',
  },
];

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: title,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upcoming Appointments',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 16),
                ...appointmentsList.map((appointment) {
                  return Appointment(
                    doctor: appointment['doctor']!,
                    date: appointment['date']!,
                    doctorType: appointment['doctorType']!,
                  );
                }),
                SizedBox(height: 16),
                Text(
                  'Past Appointments',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 16),
                ...pastAppointmentsList.map((appointment) {
                  return Appointment(
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 138, 206, 156),
        elevation: 4,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

class Appointment extends StatelessWidget {
  const Appointment({
    super.key,
    required this.doctor,
    required this.date,
    required this.doctorType,
  });

  final String doctor, date, doctorType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          print('$doctor clicked');
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.person_outlined, size: 35),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 14,
                        color: Colors.grey[600],
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      doctorType,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 14,
                        color: Colors.grey[600],
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}