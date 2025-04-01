import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/data/seat_data.dart';

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

  Row seatStateBox(Color color, String string) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 4),
        Text(string),
      ],
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

  Widget seat(BuildContext context, int rowNum, String colStr) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color:
            selectedRowGlobal == rowNum && selectedColGlobal == colStr
                ? Colors.purple
                : Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Container textBox(String text) => Container(
    width: 50,
    height: 50,
    alignment: Alignment.center,
    child: Text(text, style: TextStyle(fontSize: 18)),
  );
}
