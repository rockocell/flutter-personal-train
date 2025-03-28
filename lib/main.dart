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
    // return MaterialApp(home: HomePage());
    // **레이아웃 확인용 코드
    return MaterialApp(home: StationListPage());
    // return MaterialApp(home: SeatPage());
  }
}
