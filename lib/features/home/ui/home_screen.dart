import 'package:flutter/material.dart';
import 'package:health/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        icon: Icons.arrow_downward,
                      ),
                    ),
                    SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.5,
                      children: const [
                        MetricCard(
                          title: 'Pulse',
                          value: '80',
                          metric: 'BPM',
                          icon: Icons.arrow_back,
                        ),
                        MetricCard(
                          title: 'Activities',
                          value: '1.2k',
                          metric: 'steps',
                          icon: Icons.arrow_back,
                        ),
                        MetricCard(
                          title: 'Water',
                          value: '0.8',
                          metric: 'liters',
                          icon: Icons.arrow_back,
                        ),
                        MetricCard(
                          title: 'Calories',
                          value: '35',
                          metric: 'kcal',
                          icon: Icons.arrow_back,
                        ),
                      ],
                    ),
                    SizedBox(height: 26),
                    TextToButton(
                      title: 'Test section',
                      buttonData: ButtonData(
                        text: 'Test button',
                        icon: Icons.arrow_downward,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 450,
                      height: 450,
                      decoration: BoxDecoration(color: AppColors.textSecondary),
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
            minimumSize: Size.zero, // remove default size constraint
            tapTargetSize:
                MaterialTapTargetSize.shrinkWrap, // reduce touch padding
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Text(buttonData.text, style: TextStyle(color: Colors.black)),
              Icon(buttonData.icon, color: Colors.black),
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
      trailing: GestureDetector(
        onTap: () => print('clicked'),
        child: Icon(Icons.menu),
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Border color
          width: 0.4, // Border thickness
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title, style: TextStyle(fontSize: 18)), Icon(icon)],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              Text(metric),
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
