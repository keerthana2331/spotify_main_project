import 'package:flutter/material.dart';
import 'package:spotify_main_project/core/configs/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true, // Ensure Material 3 is enabled
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightbackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );

static final darkTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.darkbackground
  ,
  brightness: Brightness.dark,
    fontFamily: 'Satoshi',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      )
    )
  )
)
;
}
  
  

