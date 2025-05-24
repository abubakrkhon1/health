import 'package:flutter/material.dart';
import 'package:health/shared/widgets/platform_page_scaffold.dart';
import 'package:health/theme/app_colors.dart';

const medicationsList = [
  {'title': 'Metformin', 'subtitle': 'Take 2 pills every morning'},
  {'title': 'Lisinopril', 'subtitle': 'Take 1 pill every day'},
  {'title': 'Atorvastatin', 'subtitle': 'Take 1 pill at bedtime'},
  {'title': 'Aspirin 81mg', 'subtitle': 'Once a day at 08:00'},
];

const supplementList = [
  {'title': 'Metformin', 'subtitle': 'Take 2 pills every morning'},
  {'title': 'Lisinopril', 'subtitle': 'Take 1 pill every day'},
  {'title': 'Atorvastatin', 'subtitle': 'Take 1 pill at bedtime'},
  {'title': 'Aspirin 81mg', 'subtitle': 'Once a day at 08:00'},
  {'title': 'Aspirin 81mg', 'subtitle': 'Once a day at 08:00'},
  {'title': 'Aspirin 81mg', 'subtitle': 'Once a day at 08:00'},
  {'title': 'Aspirin 81mg', 'subtitle': 'Once a day at 08:00'},
];

class MedicationPage extends StatelessWidget {
  const MedicationPage({super.key, this.title});

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
                  'Medication Tracking',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 16),
                ...medicationsList.map((medication) {
                  return Medication(
                    title: medication['title']!,
                    subtitle: medication['subtitle']!,
                  );
                }),
                SizedBox(height: 16),
                Text(
                  'Supplement Tracking',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 16),
                ...supplementList.map((medication) {
                  return Supplement(
                    title: medication['title']!,
                    subtitle: medication['subtitle']!,
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
        child: Icon(Icons.add, size: 30, color: AppColors.textPrimary),
      ),
    );
  }
}

class Medication extends StatelessWidget {
  const Medication({super.key, required this.title, required this.subtitle});

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          print('$title clicked');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.medication, size: 35),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 14,
                      color: Color(0xFF4C9A61),
                      decoration: TextDecoration.none,
                    ),
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Supplement extends StatelessWidget {
  const Supplement({super.key, required this.title, required this.subtitle});

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          print('$title clicked');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.medication, size: 35),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 14,
                      color: Color(0xFF4C9A61),
                      decoration: TextDecoration.none,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
