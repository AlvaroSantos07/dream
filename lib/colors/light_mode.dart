import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.red,
    onSecondary: Colors.black,
    onPrimary: Colors.white,
    inversePrimary: Colors.blue.shade800,
    onInverseSurface: Colors.white,
    onPrimaryFixed: Colors.red,
    onSecondaryFixed: Colors.black,
    onTertiary: Colors.red
  )
);
