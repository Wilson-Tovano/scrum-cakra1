import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(93, 0, 195, 1),
  ),
  colorScheme: const ColorScheme.dark(
    background: Color.fromRGBO(11, 22, 35, 1),
    primary: Colors.white,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(const Color.fromRGBO(93, 0, 195, 1)),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ),
  ),
  textTheme: Typography.whiteMountainView.copyWith(
    bodySmall: const TextStyle(color: Color.fromRGBO(185, 185, 185, 1)),
    labelSmall: const TextStyle(color: Color.fromRGBO(185, 185, 185, 1)),
    titleSmall: const TextStyle(color: Color.fromRGBO(185, 185, 185, 1)),
    headlineSmall: const TextStyle(color: Color.fromRGBO(185, 185, 185, 1)),
    displaySmall: const TextStyle(color: Color.fromRGBO(185, 185, 185, 1)),
  ),

  // Define other properties here
);

ThemeData lightMode = ThemeData.light().copyWith(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(78, 0, 163, 1),
    foregroundColor: Colors.white,
  ),
  colorScheme: const ColorScheme.light(
    background: Color.fromRGBO(251, 251, 251, 1),
    primary: Colors.blue,
  ),
  // textButtonTheme: TextButtonThemeData(
  //   style: ButtonStyle(
  //     backgroundColor: MaterialStateProperty.all(Colors.blue),
  //     shape: const MaterialStatePropertyAll(
  //       RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20)),
  //       ),
  //     ),
  //   ),
  // ),
  textTheme: Typography.blackMountainView.copyWith(
    bodySmall: const TextStyle(color: Color.fromRGBO(167, 167, 167, 1)),
    labelSmall: const TextStyle(color: Color.fromRGBO(167, 167, 167, 1)),
    titleSmall: const TextStyle(color: Color.fromRGBO(167, 167, 167, 1)),
    headlineSmall: const TextStyle(color: Color.fromRGBO(167, 167, 167, 1)),
    displaySmall: const TextStyle(color: Color.fromRGBO(167, 167, 167, 1)),
  ),

  // Define other properties here
);
