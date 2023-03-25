import 'package:flutter/material.dart';

class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  /// [COMMON]
  static const primary = Color.fromARGB(255, 255, 69, 0);
  static const secondary = Color.fromARGB(255, 95, 153, 207);

  /// [DARK MODE]
  static const primaryDark = primary;
  static const onPrimaryDark = Color.fromARGB(255, 0, 0, 0);
  static const secondaryDark = secondary;
  static const backgroundDark = Color.fromARGB(255, 5, 5, 5);

  /// [LIGHT MODE]
  static const primaryLight = primary;
  static const onPrimaryLight = Color.fromARGB(255, 255, 255, 255);
  static const secondaryLight = secondary;
  static const backgroundLight = Color(0xFFFFFFFF);

  // Themes
  static ThemeData get darkModeAppTheme =>
      ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: backgroundDark,
          appBarTheme: AppBarTheme(
            color: backgroundDark,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: onPrimaryDark,
              backgroundColor: primaryDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          textTheme: TextTheme(
            titleMedium: TextStyle(
              color: onPrimaryDark,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.15,
            ),
          ),
          cardColor: greyColor,
          primaryColor: primaryDark,
          colorScheme: ColorScheme.dark().copyWith(
            primary: primaryDark,
            onPrimary: onPrimaryDark,
            background: backgroundDark,
          ));

  static ThemeData get lightModeAppTheme =>
      ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: backgroundLight,
        appBarTheme: AppBarTheme(
          color: backgroundLight,
          elevation: 0,
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: onPrimaryLight,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: onPrimaryLight,
            backgroundColor: primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        cardColor: greyColor,
        primaryColor: redColor,
        colorScheme: ColorScheme.light().copyWith(
          primary: primaryLight,
          onPrimary: onPrimaryLight,
          background: backgroundLight,
        ),
      );
}
