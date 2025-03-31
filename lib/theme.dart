import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
    surfaceContainer: Colors.white, //HomePage 중앙 컨테이너
    secondaryContainer: Colors.grey[300]!, //SeatPage 좌석 컨테이너
    surface: Colors.grey[200]!, //HomePage 백그라운드
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      backgroundColor: WidgetStatePropertyAll(Colors.purple),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  scaffoldBackgroundColor: Colors.white,
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.dark,
    surfaceContainer: Colors.grey[800]!, //HomePage 중앙 컨테이너
    secondaryContainer: Colors.grey[700]!, //SeatPage 좌석 컨테이너
    surface: Colors.black, //HomePage 백그라운드
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      backgroundColor: WidgetStatePropertyAll(Colors.purple),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.black),
  scaffoldBackgroundColor: Colors.black,
);
