import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/home_page.dart';
import 'package:flutter_train_seat_app/seat_page.dart';
import 'package:flutter_train_seat_app/station_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
      ),
      // home: HomePage(),
      // home: StationListPage(),
      home: SeatPage(),
    );
  }
}
