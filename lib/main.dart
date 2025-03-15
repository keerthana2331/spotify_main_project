import 'package:flutter/material.dart';
import 'package:spotify_main_project/presentation/splash/pages/splash.dart';
import 'core/configs/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false, // Correct reference to the theme
      home:  const SplashPage(),
    );
  }
}