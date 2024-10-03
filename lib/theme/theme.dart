import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: const Color.fromARGB(255, 31, 31, 31),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
    iconTheme: IconThemeData(color: Colors.white),
    ),
  dividerColor: Colors.white24,
  useMaterial3: true,
  listTileTheme: ListTileThemeData(iconColor: Colors.white),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white60,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    )
  ),
);