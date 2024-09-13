import 'package:flutter/material.dart';

final class AppTheme {
  AppTheme._();

  static final ThemeData appTheme = ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
              brightness: Brightness.dark,
              surface: const Color(0xff222222)))
      .copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 255, 153, 0),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        )),
        backgroundColor: WidgetStateProperty.all(Colors.orange),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
    ),
  );
}
