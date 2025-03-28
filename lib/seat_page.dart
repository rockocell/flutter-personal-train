import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('수서'),
              Icon(Icons.arrow_circle_right_outlined),
              Text('부산'),
            ],
          ),
        ],
      ),
    );
  }
}
