import 'package:flutter/material.dart';

class AppTheme {
  static const Color greenColor = Color(0xFF8bc33c);
  static const Color redColor = Color(0xFFec1923);
  static const Color whiteColor = Color(0xFFF8F8FF);
  static const Color blueColor = Color(0xFF044972);
  static const Color hintColor = Colors.grey;
  static final Color greyColor = Colors.grey[300]!;
  static final Color lightBlue = Colors.blue[100]!;
  static final Color darkGrey = Colors.grey[700]!;

  static const TextStyle labelLarge =
      TextStyle(color: blueColor, fontSize: 16.0, fontWeight: FontWeight.bold);
  static const TextStyle displayLarge =
      TextStyle(color: blueColor, fontSize: 32.0, fontWeight: FontWeight.bold);
  static final TextStyle bodyLarge = TextStyle(color: darkGrey, fontSize: 18.0);

  static final MaterialColor primarySwatch = createMaterialColor(blueColor);
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    scaffoldBackgroundColor: whiteColor,
    primaryColor: blueColor,
    hintColor: hintColor,
    textTheme: TextTheme(
      labelLarge: labelLarge,
      displayLarge: displayLarge,
      bodyLarge: bodyLarge,
    ),
    appBarTheme: AppBarTheme(
      color: blueColor,
      iconTheme: const IconThemeData(color: whiteColor),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: whiteColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: whiteColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ).titleLarge,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: blueColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: whiteColor,
        backgroundColor: blueColor,
        textStyle: const TextStyle(fontSize: 16.0),
      ),
    ),
   
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: blueColor,
      foregroundColor: whiteColor,
    ),
  );

  static createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
