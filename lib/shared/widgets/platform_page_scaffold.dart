import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/theme/app_colors.dart';

class PlatformScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? floatingActionButton;

  const PlatformScaffold({this.title, required this.body, this.floatingActionButton, super.key});

  @override
  Widget build(BuildContext context) {
    final showAppBar = title != null;

    return Platform.isIOS
        ? CupertinoPageScaffold(
          backgroundColor: AppColors.background,
          navigationBar:
              showAppBar ? CupertinoNavigationBar(middle: Text(title!)) : null,
          child: SafeArea(child: body),
        )
        : Scaffold(
          backgroundColor: AppColors.background,
          appBar: showAppBar ? AppBar(title: Text(title!)) : null,
          body: body,
          floatingActionButton: floatingActionButton,
        );
  }
}
