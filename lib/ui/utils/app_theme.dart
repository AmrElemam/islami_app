import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
abstract class AppTheme{
  static const TextStyle appbartitlestyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.accent);
  static const TextStyle qurantabtitletextstyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.accent);
  static const TextStyle suranametextstyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.normal, color: AppColors.accent);
  static const TextStyle SettingsTabTitle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.accent);
  static const TextStyle SettingsOptionTitle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.normal, color: AppColors.accent);
  static const TextStyle DetailsTextStyle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.normal, color: AppColors.accent);
  static ThemeData LightTheme = ThemeData(
      primaryColor: AppColors.primiary,
      scaffoldBackgroundColor: AppColors.transparent,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          titleTextStyle: AppTheme.appbartitlestyle),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accent,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 26)),
      dividerTheme: const DividerThemeData(
        thickness: 3,
        color: AppColors.primiary,
      ),
      textTheme: const TextTheme(
        bodyMedium: SettingsTabTitle,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.primiary),
        trackColor: MaterialStateProperty.all(AppColors.accent),
      ));

  static ThemeData DarkTheme = ThemeData(
      primaryColor: AppColors.primiarydark,
      scaffoldBackgroundColor: AppColors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          titleTextStyle:
              AppTheme.appbartitlestyle.copyWith(color: AppColors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accentdark,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 26)),
      dividerTheme: const DividerThemeData(
        thickness: 3,
        color: AppColors.accentdark,
      ),
      textTheme: TextTheme(
        bodyMedium: SettingsTabTitle.copyWith(color: AppColors.white),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.accentdark),
        trackColor: MaterialStateProperty.all(AppColors.white),
      ));
}