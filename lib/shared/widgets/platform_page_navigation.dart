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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: backgroundColor,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        type: BottomNavigationBarType.fixed,
        items: items,
      ),
    );
  }
}
