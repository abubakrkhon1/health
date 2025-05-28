import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/features/main_nav/ui/main_nav_page.dart';
import 'package:health/theme/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://jcqprnnidzphbdoudvxf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjcXBybm5pZHpwaGJkb3VkdnhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDgxNTUyMTQsImV4cCI6MjA2MzczMTIxNH0.uVuhBhBRI-mbd9YEFAGXB82C_92WlJqaxnCXxen32tU',
  );

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: AppColors.background,
          scaffoldBackgroundColor: AppColors.background,
          // Complete text theme with no decorations
          textTheme: const TextTheme(
            displayLarge: TextStyle(decoration: TextDecoration.none),
            displayMedium: TextStyle(decoration: TextDecoration.none),
            displaySmall: TextStyle(decoration: TextDecoration.none),
            headlineLarge: TextStyle(decoration: TextDecoration.none),
            headlineMedium: TextStyle(decoration: TextDecoration.none),
            headlineSmall: TextStyle(decoration: TextDecoration.none),
            titleLarge: TextStyle(decoration: TextDecoration.none),
            titleMedium: TextStyle(decoration: TextDecoration.none),
            titleSmall: TextStyle(decoration: TextDecoration.none),
            bodyLarge: TextStyle(decoration: TextDecoration.none),
            bodyMedium: TextStyle(decoration: TextDecoration.none),
            bodySmall: TextStyle(decoration: TextDecoration.none),
            labelLarge: TextStyle(decoration: TextDecoration.none),
            labelMedium: TextStyle(decoration: TextDecoration.none),
            labelSmall: TextStyle(decoration: TextDecoration.none),
          ),
          // Additional theme properties to prevent underlines
          useMaterial3: true,
        ),
        home: MainNavigationPage(),
      ),
    ),
  );
}
