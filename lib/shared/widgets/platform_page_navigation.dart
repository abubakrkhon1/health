import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformMainNavigation extends StatelessWidget {
  final int currentIndex;
  final List<Widget> pages;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;

  const PlatformMainNavigation({
    super.key,
    required this.currentIndex,
    required this.pages,
    required this.onTap,
    required this.items,
    required this.backgroundColor,
    required this.selectedItemColor,
    required this.unselectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: currentIndex,
          onTap: onTap,
          activeColor: selectedItemColor,
          inactiveColor: unselectedItemColor,
          backgroundColor: backgroundColor,
          items: items,
        ),
        tabBuilder:
            (context, index) => CupertinoPageScaffold(child: pages[index]),
      );
    }

    return Scaffold(
      body: pages[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define what "+" does here
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white, size: 30),
        elevation: 4,
        shape: CircleBorder(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 10,
        color: backgroundColor,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavIcon(
                0,
                items[0].icon,
                selectedItemColor,
                unselectedItemColor,
              ),
              _buildNavIcon(
                1,
                items[1].icon,
                selectedItemColor,
                unselectedItemColor,
              ),
              const SizedBox(width: 48), // For FAB spacing
              _buildNavIcon(
                2,
                items[2].icon,
                selectedItemColor,
                unselectedItemColor,
              ),
              _buildNavIcon(
                3,
                items[3].icon,
                selectedItemColor,
                unselectedItemColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(
    int index,
    Widget icon,
    Color selectedColor,
    Color unselectedColor,
  ) {
    return Expanded(
      // Makes sure spacing is equal
      child: InkWell(
        onTap: () => onTap(index),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0), // Less top padding
          child: IconTheme(
            data: IconThemeData(
              size: 28,
              color: currentIndex == index ? selectedColor : unselectedColor,
            ),
            child: Center(child: icon),
          ),
        ),
      ),
    );
  }
}
