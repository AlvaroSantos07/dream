import 'dart:ui';
import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.deepPurple,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    onInverseSurface: Colors.deepPurple,
    onPrimaryFixed: Colors.black,
    onSecondaryFixed: Colors.black,
    onTertiary: Colors.green
  )
);