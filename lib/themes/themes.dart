import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    highlightColor: const Color.fromARGB(255, 255, 17, 0),
    unselectedWidgetColor: const Color.fromARGB(255, 228, 227, 227),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 17, 0)),
    hintColor: Colors.grey,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 13, color: Colors.black),
      titleMedium: TextStyle(fontSize: 17, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
      titleSmall: TextStyle(
        fontSize: 11.5,
        color: Colors.black,
      ),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    secondaryHeaderColor: const Color.fromARGB(255, 255, 17, 0),
    unselectedWidgetColor: const Color.fromARGB(255, 19, 19, 19),
    highlightColor: const Color.fromARGB(255, 255, 17, 0),
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    hintColor: Colors.grey,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 13, color: Colors.white),
      titleMedium: TextStyle(fontSize: 17, color: Colors.white),
      titleLarge: TextStyle(
          fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
      titleSmall: TextStyle(
        fontSize: 11.5,
        color: Colors.white,
      ),
    ),
  );
}
