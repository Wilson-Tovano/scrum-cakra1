import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    secondary: Colors.grey[800]!,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        )
      )
    ),
  ),
  // Define other properties here
);

ThemeData lightMode = ThemeData.light().copyWith(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
    )
    // Define other properties here
    );
