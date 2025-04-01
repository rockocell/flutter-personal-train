import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/widgets/widgets_seats.dart'; // seat, textBox 임포트

class MySeat extends StatelessWidget {
  const MySeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('예매 확인'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textBox('A'),
              SizedBox(width: 4),
              textBox('B'),
              SizedBox(width: 4),
              textBox(''),
              SizedBox(width: 4),
              textBox('C'),
              SizedBox(width: 4),
              textBox('D'),
            ],
          ),
          ...List.generate(20, (index) {
            int rowNum = index + 1;
            return Padding(
              padding:
                  rowNum != 20
                      ? const EdgeInsets.only(bottom: 8)
                      : EdgeInsets.zero,
              child: row(context, rowNum),
            );
          }),
        ],
      ),
    );
  }

  Row row(BuildContext context, int rowNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seat(context, rowNum, 'A'),
        SizedBox(width: 4),
        seat(context, rowNum, 'B'),
        SizedBox(width: 4),
        textBox('$rowNum'),
        SizedBox(width: 4),
        seat(context, rowNum, 'C'),
        SizedBox(width: 4),
        seat(context, rowNum, 'D'),
      ],
    );
  }
}
