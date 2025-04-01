import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/pages/home_page.dart';
import 'package:flutter_train_seat_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark, //테마 테스트 코드
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
