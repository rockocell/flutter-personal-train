import 'package:flutter/material.dart';

/// 출발역, 도착역 레이아웃 Col
///
Widget displayStationName({required String title, required String? selected}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(selected ?? '선택', style: TextStyle(fontSize: 40)),
      ],
    ),
  );
}
