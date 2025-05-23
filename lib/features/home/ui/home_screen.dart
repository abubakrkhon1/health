import 'package:flutter/material.dart';
import 'package:health/features/notifications/ui/notifications_page.dart';
import 'package:health/theme/app_colors.dart';
import 'dart:io';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Menu', style: TextStyle(color: Colors.white)),
            ),
            ListTile(title: Text('Home'), onTap: () {}),
            ListTile(title: Text('Profile'), onTap: () {}),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextToButton(
                      title: 'Health Metrics',
                      buttonData: ButtonData(
                        text: 'Today',
                        icon: Icons.keyboard_arrow_down,
                      ),
                    ),
                    SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.1, // Adjust card proportions
                      children: const [
                        MetricCard(
                          title: 'Pulse',
                          value: '80',
                          metric: 'BPM',
                          icon: Icons.keyboard_arrow_left,
                        ),
                        MetricCard(
                          title: 'Activities',
                          value: '1.2k',
                          metric: 'steps',
                          icon: Icons.keyboard_arrow_left,
                        ),
                        MetricCard(
                          title: 'Water',
                          value: '0.8',
                          metric: 'liters',
                          icon: Icons.keyboard_arrow_left,
                        ),
                        MetricCard(
                          title: 'Calories',
                          value: '35',
                          metric: 'kcal',
                          icon: Icons.keyboard_arrow_left,
                        ),
                      ],
                    ),
                    SizedBox(height: 26),
                    TextToButton(
                      title: 'Test section',
                      buttonData: ButtonData(
                        text: 'Test',
                        icon: Icons.keyboard_arrow_down,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 450,
                      height: 450,
                      decoration: BoxDecoration(
                        color: AppColors.textSecondary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(child: CircularProgressIndicator()),
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

class TextToButton extends StatelessWidget {
  const TextToButton({
    super.key,
    required this.title,
    required this.buttonData,
  });

  final String title;
  final ButtonData buttonData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: const BorderSide(color: Colors.grey, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                buttonData.text,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              SizedBox(width: 4),
              Icon(buttonData.icon, color: Colors.black, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 20, left: 25, right: 25),
      leading: CircleAvatar(
        radius: 32,
        backgroundImage: AssetImage('assets/images/user.png'),
      ),
      title: Text('Hello,'),
      subtitle: Text(
        'User',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing:
          Platform.isAndroid
              ? GestureDetector(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: Icon(Icons.menu),
              )
              : GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsPage(),
                      ),
                    ),
                child: Icon(Icons.notifications),
              ),
    );
  }
}

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.value,
    required this.metric,
    required this.title,
    required this.icon,
  });

  final String value, metric, title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(icon, size: 18, color: Colors.grey),
            ],
          ),
          // Value and metric row
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                metric,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonData {
  final String text;
  final IconData icon;

  ButtonData({required this.text, required this.icon});
}
