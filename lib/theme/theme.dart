import 'package:flutter/material.dart';
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.black,
    secondary: Colors.grey[800]!,
  )
  // Define other properties here
);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.blue,
    primary: Colors.white,
    secondary: Colors.blue[800]!,
  )
  // Define other properties here
);
