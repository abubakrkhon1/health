import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/features/profile/ui/profile_settings_page.dart';
import 'package:health/shared/widgets/appointment_card.dart';
import 'package:health/shared/widgets/bottom_nav_provider.dart';
import 'package:health/shared/widgets/user_provider.dart';

import 'package:lucide_icons/lucide_icons.dart';

import 'package:health/features/notifications/ui/notifications_page.dart';
import 'package:health/theme/app_colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, String>> appointments = [
      {
        'date': 'Wed Jun 20',
        'time': '8:00 - 8:30',
        'doctor': 'Dr. Nirmala Azalea',
        'doctorType': 'Orthopedic',
      },
      {
        'date': 'Wed Mar 29',
        'time': '8:00 - 8:30',
        'doctor': 'Dr. Aaron Gordon',
        'doctorType': 'Orthopedic',
      },
      {
        'date': 'Wed Jun 20',
        'time': '12:30 - 14:30',
        'doctor': 'Dr. Strange',
        'doctorType': 'Orthopedic',
      },
      {
        'date': 'Wed Jun 20',
        'time': '8:00 - 8:30',
        'doctor': 'Dr. Nirmala Azalea',
        'doctorType': 'Orthopedic',
      },
    ];

    final content = SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color.fromARGB(255, 110, 185, 255)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context, ref),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 20.0,
                      ),
                      child: _dividerText(
                        context: context,
                        text: 'Quick Services',
                      ),
                    ),
                    _buildQuickServices(context, ref),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _dividerText(
                            context: context,
                            text: 'My Appointments',
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View all',
                              style: Theme.of(
                                context,
                              ).textTheme.headlineMedium?.copyWith(
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          ...appointments.map((appointment) {
                            return appointmentCard(
                              context: context,
                              appointmentType: 'Upcoming appointment',
                              date: appointment['date']!,
                              time: appointment['time']!,
                              doctor: appointment['doctor']!,
                              doctorType: appointment['doctorType']!,
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(backgroundColor: Colors.white, child: content)
        : Scaffold(
          backgroundColor: AppColors.background,
          endDrawer: _appDrawer(context),
          body: content,
        );
  }

  Widget _buildQuickServices(BuildContext context, WidgetRef ref) {
    final services = [
      {
        'label': 'Consultation',
        'asset': 'assets/images/doctor-app.png',
        'index': 2,
      },
      {
        'label': 'Medicines',
        'asset': 'assets/images/medicines.png',
        'index': 1,
      },
      {
        'label': 'Ambulance',
        'asset': 'assets/images/ambulance.png',
        'index': 0,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            services.map((service) {
              return GestureDetector(
                onTap: () {
                  ref.read(bottomNavProvider.notifier).state =
                      service['index'] as int;
                },
                child: _quickServiceCard(
                  context: context,
                  label: service['label'] as String,
                  assetPath: service['asset'] as String,
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _quickServiceCard({
    context,
    required String label,
    required String assetPath,
  }) {
    return Container(
      width: 100,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade100,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset(assetPath, fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 12),
          Text(
            label,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _appDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              'Menu',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
          ),
          ListTile(title: Text('Home'), onTap: () {}),
          ListTile(title: Text('Profile'), onTap: () {}),
        ],
      ),
    );
  }

  Widget _header(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.notifier).state;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileSettingsPage(),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Platform.isIOS ? CupertinoColors.systemGrey6 : Colors.white,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  shadowColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(5),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsPage(),
                    ),
                  );
                },
                icon: Icon(LucideIcons.bell),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    user?.fullName ?? 'User',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.primary,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Have a nice day',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 22),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(LucideIcons.siren, color: Colors.white),
                    label: Text(
                      'Urgent care',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 14,
                      ),
                      shape: StadiumBorder(),
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/doctor.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dividerText({required BuildContext context, required String text}) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

// Widget _buildClinicCards(BuildContext context) {
//     Widget _clinicTile() {
//       return GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder:
//                   (context) => ClinicPage(clinic: {'name': 'OftobMedline'}),
//             ),
//           );
//         },
//         child: Container(
//           margin: EdgeInsets.only(bottom: 12),
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//           decoration: BoxDecoration(
//             color: Platform.isIOS ? CupertinoColors.systemGrey6 : Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: CupertinoColors.separator, width: 0.6),
//           ),
//           child: Row(
//             children: [
//               Icon(
//                 Platform.isIOS ? CupertinoIcons.location : Icons.location_on,
//                 color: AppColors.primary,
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'OFTOB MEDLINE',
//                       style: Theme.of(
//                         context,
//                       ).textTheme.headlineMedium?.copyWith(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: Colors.black,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       '87P4+W46, Tashkent, Uzbekistan',
//                       style: Theme.of(
//                         context,
//                       ).textTheme.headlineMedium?.copyWith(
//                         color: CupertinoColors.inactiveGray,
//                         fontSize: 13,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Icon(
//                 Platform.isIOS
//                     ? CupertinoIcons.chevron_forward
//                     : Icons.keyboard_arrow_right,
//                 color: Colors.grey,
//                 size: 20,
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     return Column(children: [_clinicTile(), _clinicTile(), _clinicTile()]);
//   }
